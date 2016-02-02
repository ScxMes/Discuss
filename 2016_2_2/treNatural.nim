import re

var
  str = "yrs123-5 10 abc"
  re1 = re(reNatural)     #自然数
  re2 = re(reInteger)     #整型
  re3 = re"\b(\-\d)+\b"
  re4 = re(r"\b\-" & reInteger)    #注意 连接时  "\b\-" 前面加 r,  原始字符串字面量不能和普通字符串连接

echo findAll(str, re1)
echo findAll(str, re2)
echo findAll(str, re3)
echo findAll(str, re4)

