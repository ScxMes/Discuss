
include "system/inclrtl"

type
  Stream* = ref StreamObj
  StreamObj* = object of RootObj ## Stream interface that supports
                                 ## writing or reading. Note that these fields
                                 ## here shouldn't be used directly. They are
                                 ## accessible so that a stream implementation
                                 ## can override them.
  
    readDataImpl*: proc (s: Stream, buffer: pointer,
                         bufLen: int): int {.nimcall, tags: [ReadIOEffect], gcsafe.}

proc readData*(s: Stream, buffer: pointer, bufLen: int): int =
  ## low level proc that reads data into an untyped `buffer` of `bufLen` size.
  result = s.readDataImpl(s, buffer, bufLen)

proc YreadChar*(s: Stream): char =
  ## reads a char from the stream `s`. Raises `EIO` if an error occurred.
  ## Returns '\0' as an EOF marker.
  if readData(s, addr(result), sizeof(result)) != 1: result = '\0'

proc YreadLine*(s: Stream, line: var TaintedString): bool =
  ## reads a line of text from the stream `s` into `line`. `line` must not be
  ## ``nil``! May throw an IO exception.
  ## A line of text may be delimited by ``CR``, ``LF`` or
  ## ``CRLF``. The newline character(s) are not part of the returned string.
  ## Returns ``false`` if the end of the file has been reached, ``true``
  ## otherwise. If ``false`` is returned `line` contains no new data.
  line.string.setLen(0)
  while true:
    var c = YreadChar(s)
    if c == '\c':
      c = YreadChar(s)
      break
    elif c == '\L': break
    elif c == '\0':
      if line.len > 0: break
      else: return false
    line.string.add(c)
  result = true

type
  StringStream* = ref StringStreamObj ## a stream that encapsulates a string
  StringStreamObj* = object of StreamObj
    data*: string
    pos: int

proc YcopyMem*(dest, source: pointer, size: Natural) {.
    importc: "memcpy", header: "<string.h>", benign.}
    ## copies the contents from the memory at ``source`` to the memory
    ## at ``dest``. Exactly ``size`` bytes will be copied. The memory
    ## regions may not overlap. Like any procedure dealing with raw
    ## memory this is *unsafe*.

proc ssReadData(s: Stream, buffer: pointer, bufLen: int): int =
  var s = StringStream(s)
  result = min(bufLen, s.data.len - s.pos)
  if result > 0:
    YcopyMem(buffer, addr(s.data[s.pos]), result)
    inc(s.pos, result)

proc newStringStream*(s: string = ""): StringStream =
  ## creates a new stream from the string `s`.
  new(result)
  result.data = s
  result.pos = 0
  result.readDataImpl = ssReadData

var
  ss = newStringStream("""The first line
the second line
the third line""")
  line = ""
while ss.YreadLine(line):
  echo line