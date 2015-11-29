import streams

var line = ""
var fs = newFileStream("TStringStreamE.nim", fmRead)
if not isNil(fs):
  while fs.readLine(line):
    echo line
fs.close()