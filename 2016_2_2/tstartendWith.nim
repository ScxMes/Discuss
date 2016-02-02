import re

var
  str = "yrs123 abc 3"
  startRe = re(reIdentifier)
  endRe = re"\d"
  
echo startsWith(str, startRe)      #判断字符串str是否是以stratRe模式开始
echo endsWith(str, endRe)          ##判断字符串str是否是以endRe模式结尾
