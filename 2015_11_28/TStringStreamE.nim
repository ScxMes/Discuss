import streams
var
  ss = newStringStream("""The first line
    the second line
    the third line""")
  line = ""
while ss.readLine(line):
  echo line
ss.close()