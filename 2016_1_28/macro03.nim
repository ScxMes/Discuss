#[
forum:
You can use n.kind (proc kind) to obtain the NimNodeKind of a Nim node n, n.symbol (proc symbol) to obtain the NimSym of a Nim node that represents a symbol, and sym.getImpl (proc getImpl) to get the definition of a symbol.
For example, I've extended your code to use these procs:

]#
import macros, strutils

type 
  TypeA = distinct int
  TypeB = distinct int

proc printSymbolDef(sym: NimSym) {.compileTime.} =
  echo "\n=> printSymbolDef(sym: $#)" % $sym
  let impl = sym.getImpl
  echo "sym.impl == " & $impl.treeRepr
  echo "\nimpl.kind == " & $impl.kind
  if impl.kind == nnkConv:
    echo impl[0].treeRepr
    echo "=====> " & $impl[0].symbol
  elif impl.kind == nnkSym:
    # Recursion!
    printSymbolDef(impl.symbol)

macro printType(e: typed): stmt =
  echo e.getType.treeRepr
  echo "----"
  echo "e.kind == " & $e.kind
  if e.kind == nnkSym:
    printSymbolDef(e.symbol)
  
  echo "\n********\n"
  discard

let a = 0.TypeA
var b: TypeB = 0.TypeB
var c: TypeB = b

printType(a)
printType(b)
printType(c)


