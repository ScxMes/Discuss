
#http://forum.nim-lang.org/t/1498#9344
import macros, strutils
proc fn1(arg: cstring): int {.importc: "fn_fast", header: "vfn.h", cdecl.}
proc fnV(arg: cstring): int {.importc: "vfn", header: "vfn.h", varargs, cdecl.}

macro fn(args: varargs[untyped]): untyped =
  if args.len == 1:
    result = newCall(bindSym"fn1")
  else:
    result = newCall(bindSym"fnV")
  for arg in args.children:
    result.add(arg)

var result: int = fn(23, "astring")
#[
Wow, that's so much simpler than I was making it out to be! After reviewing the Manual again I'm left wondering why this beautifully-working macro's return type is 'untyped' when I know it must be a statement 'stmt'? And indeed it breaks if I try a 'stmt' return type. 2015-08-05 19:47:52
 
Araq
Because the call it generates returns an int.
]#
