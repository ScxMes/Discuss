template typedef(name: expr, typ: typedesc) {.immediate.} =
  type
    `T name`* {.inject.} = typ
    `P name`* {.inject.} = ref `T name`

typedef(myint, int)
var 
    x: PMyInt
    b:int=3
x=addr(b)
echo repr(x)


