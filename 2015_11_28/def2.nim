proc fgets(c: cstring, n: int, f: TFile): cstring {.importc: "fgets", header: "<stdio.h>".}
#, tags: [FReadIO]
proc myReadLine(f: TFile, line: var TaintedString): bool =
  var buf {.noinit.}: array[8192, char]
  setLen(line.string, 0)
  result = true
  while true:
    if fgets(buf, 8192, f) == nil:
      result = false
      break
    let l = cstring(buf).len-1
    if buf[l] == '\l':
      buf[l] = '\0'
      add(line, cstring(buf))
      break
    add(line, cstring(buf))

var str = ""
echo stdin.myReadLine(str)
echo str