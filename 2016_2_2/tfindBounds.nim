import re

var
  str = "yrs123 abc"
  re1 = re(reIdentifier)         #(exp) 用来捕获匹配exp的子串 
  first, last = 0
for sub in findAll(str, re1):
  echo sub
  (first, last) = findBounds(str, re1, last)      #返回s中能够匹配模式re1的子串的位置
  echo "first position: ", first
  echo "last position: ", last

