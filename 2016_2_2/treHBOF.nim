import re

var
  str = "yrs 0xA0123 1.234 0B101 0o457 0.3452 abc"
  re1 = re(reHex)
  re2 = re(reBinary)
  re3 = re(reOctal)
  re4 = re(reFloat)

echo findAll(str, re1)
echo findAll(str, re2)
echo findAll(str, re3)
echo findAll(str, re4)