import macros,strutils
macro createType(t: typed): typed =
  echo repr(t)
  discard

type MyEnum2 = enum
  a1 , b1 , c1
createType:
  type MyEnum = enum
    a , b , c
  type ArrrType = object
    arg1: range[0..200]
    arg2: int
    arg3: MyEnum
    #arg4: MyEnum2
  MyEnum2
  

