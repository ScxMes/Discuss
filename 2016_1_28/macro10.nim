import tables, macros

macro memoize(e: expr): stmt =
  template memo(n, nT, returnT, procName, procBody: expr): stmt =
    var cache = initTable[nT, returnT]()
    when not declared(procName):
      proc procName(n: nT): returnT
    proc fun(n: nT): returnT {.gensym.} = procBody
    proc procName(n: nT): returnT =
      if not cache.hasKey(n): cache[n] = fun(n)
      return cache[n]
  let
    returnT = e.params()[0]
    param   = e.params()[1]
    (n, nT) = (param[0], param[1])
  getAst(memo(n, nT, returnT, e.name(), e.body()))

proc fib(n: int): int

proc fibA(n: int): int {.memoize.} =
  if n < 2: n else: fib(n-1) + fib(n-2)

proc fibB(n: int): int {.memoize.} =
  if n < 2: n else: fibA(n-1) + fib(n-2)

proc fib(n: int): int {.memoize.} =
  if n < 2: n else: fibA(n-1) + fibB(n-2)

echo fib(66)
