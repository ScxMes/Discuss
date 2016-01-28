import tables, macros

macro memoize(e: expr): stmt =
  
  template memo(n, nType, retType, procName, procBody : expr): stmt =
    var cache = initTable[nType,retType]()
    proc procName(n : nType) : retType
    proc funName(n : nType) : retType {.gensym.} =
      procBody
    proc procName(n : nType) : retType =
      if not cache.hasKey(n):
        cache[n] = funName(n)
      return cache[n]
  
  let
    retType = e.params()[0]
    param   = e.params()[1]
  getAst(memo(param[0], param[1], retType, e.name(), e.body()))

proc fib(n : int) : int {.memoize.} =
  if n < 2:
    n
  else:
    fib(n-1) + fib(n-2)

proc fac(n : int) : int {.memoize.} =
  if n < 2:
    n
  else:
    n * fac(n-1)

echo fib(66)
echo fac(16)
