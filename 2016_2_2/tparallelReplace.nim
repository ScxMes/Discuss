import re

var
  str = "yrs123 abc 1"
  re1 = re(reIdentifier)
  re2 = re"(\w)"

echo parallelReplace(str, [(re1, "aaa"),(re2, "0")])     #用数组中元组内的字符串替换匹配到的所有子字符串，返回一个替换后的字符串，不改变原来的字符串，
echo str