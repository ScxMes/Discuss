import re

var
  str = "yrs http://nim-lang.org ftp://www.baidu.com abc"
  re1 = re(reURL)    #reURL为常量，描述一个URL

echo findAll(str, re1)