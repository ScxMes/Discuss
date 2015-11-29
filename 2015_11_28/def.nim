
proc fgetc*(f: File): char {.
      importc: "fgetc", header: "<stdio.h>", tags: [ReadIOEffect].}
      ## Reads a single character from the stream `f`.

proc ungetc*(c:char,f: File): int {.
      importc: "ungetc", header: "<stdio.h>", tags: [ReadIOEffect].}
      ## Reads a single character from the stream `f`.

proc readLine(f: TFile, line: var TaintedString): bool =
  # of course this could be optimized a bit; but IO is slow anyway...
  # and it was difficult to get this CORRECT with Ansi C's methods
  setLen(line.string, 0) # reuse the buffer!
  while true:
    var c = int(fgetc(f))
    
    if c < 0'i32:
      if line.len > 0: break
      else: return false
    if c == 10'i32: break # LF
    if c == 13'i32:  # CR
      c = int(fgetc(f)) # is the next char LF?
      if c != 10'i32: discard ungetc(char(c), f) # no, put the character back
      break
    add line.string, chr(int(c))
  result = true

var str = ""
echo stdin.readLine(str)
echo str