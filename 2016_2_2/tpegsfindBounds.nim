import pegs

var
  str = "yrs123 abc"
  peg1 = peg"{\ident}"
  first, last = 0

var 
  captures = ["a", "b", "c"]
  index = 0

last = 0
for sub in findAll(str, peg1):
  echo sub
  (first, last) = findBounds(str, peg1, captures, last)      #
  echo "first position: ", first
  echo "last position: ", last
  echo @captures