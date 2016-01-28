#参见http://forum.nim-lang.org/t/1889#11718
import macros, strutils
#======================
const banana = join(["bana", "na"])


proc foo(arg:string): int = 0

macro foobar(arg: typed): stmt =
  # it's not the root node I am working on.
  let subNode = arg[1]
  echo subNode.treeRepr     # Sym "banana"
  echo subNode.getType.repr # string
  #echo subNode.strVal       # Error: field 'strVal' cannot be found  作者修改为下句OK
  echo subNode.symbol.getImpl.strVal
  
  let sym = subNode.symbol
  echo sym.repr             # banana
  echo sym.getImpl.kind             # Error: type mismatch: got (NimSym), expected macros.kind(n: NimNode)高改getImpl
  #echo sym.strVal           # Error: type mismatch: got (NimSym), expected macros.strVal(n: NimNode)
  echo sym.getImpl.strVal


foobar(foo(banana))

#[
I found a solution. For some reason, getImpl doesn't get me the tree in the const declaration, but a string literal. Which I think I pretty weired, because It doesn't represent the AST in any way. But at least I can use it to get the string value of my symbol. So this is my solution:


macro foobar(arg: typed): stmt =
  let subNode = arg[1]
  echo subNode.symbol.getImpl.strVal
Araq say：Only by overloading. Btw all caps for macros is ugly.
]#


