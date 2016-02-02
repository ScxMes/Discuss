import re

var
  str = "yrs123 abc"
  re1 = re"(\b[a-zA-Z_]+[a-zA-Z_0-9]*\b)\s+(\w+)"         #(exp) 用来捕获匹配exp的子串 
  first, last = 0

var 
  captures = [(0,2),(3,5)]

for sub in findAll(str, re1):
  echo sub
  (first, last) = findBounds(str, re1, captures, last)      #返回s中能够匹配模式re1的子串的位置，并且捕获子串的位置到数组
  echo "first position: ", first
  echo "last position: ", last
  echo @captures