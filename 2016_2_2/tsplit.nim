import re

echo split("aaa00232this02939is39an22example111aaa", re"\d+")

for word in split("00232this02939is39an22example111", re"\d+"):
  writeLine(stdout, word)    #注意切割时头尾有空字符串