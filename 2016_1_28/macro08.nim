import macros
macro print(s: stmt): stmt =
  echo treeRepr s
  result = s

print:
  
  echo "print macro"

proc anything() {.print.} =
  echo 5

anything()
