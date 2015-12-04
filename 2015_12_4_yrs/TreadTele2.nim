##适合所有格式
##

import strutils

var 
  file:File
  line = ""
  singleStr = ""
  sum:float


file = open(r"/home/YRS/nimtest/stream/tele2.data",fmRead)

proc average(file: File): float =
  var 
    lines = 0
    first:int
    second:int
  while file.readLine(line):
    inc(lines)
    first = 0
    second = 0

    for n,char in line:
      if char == '.' and first == 0:
         first = n
         continue
      if first != 0 and char == '.':
         second = n
         break
    #echo first," ",second
    singleStr = line[first+3 .. second+2]
    if singleStr[0] == ' ':
      singleStr = singleStr[1..5]
    sum = sum + parseFloat(singleStr)
 
  result = sum / float(lines)

echo file.average()  
file.close()
