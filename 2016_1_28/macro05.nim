#http://forum.nim-lang.org/t/1696#10617

import macros, times, strutils

type Data* = object
  value*: int
  fvalue*: float
  tvalue*: Time

iterator objfields(t: typedesc): (NimNode, NimNode) =
  let reclist = t.getType[1]
  for i in 0..len(reclist)-1:
    echo reclist[i].getType.treeRepr
    yield (reclist[i], reclist[i].getType)

macro test(): stmt =
  result = newStmtList()
  for n, t in Data.objfields:
    let i = $n
    let i2 = $t
    let s = quote do:
      echo `i`, ", ", `i2`
    result.add(s)

test()

#bindSym("TimeInfo").getType should work. (Araq)
