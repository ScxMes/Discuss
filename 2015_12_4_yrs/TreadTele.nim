##只适合tele.data 这种固定长度格式
##

import strutils

var 
  file:File
  line = ""
  sumstr = ""
  sum:float


file = open(r"/home/YRS/nimtest/stream/tele.data",fmRead)

proc average(file: File): float =
  var lines = 0
  while file.readLine(line):
    inc(lines)
    sumstr = line[^12 .. ^7]
    if sumstr[0] == ' ':
      sumstr = sumstr[1..5]
    sum = sum + parseFloat(sumstr)
  #echo sum
  #echo float(lines) 
  result = sum / float(lines)

echo file.average()  
file.close()
