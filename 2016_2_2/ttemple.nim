import re 


for line in lines("./treplace.nim"):
  if line =~ re"\s*(\w+)\s*\=\s*(\w+)":
    # matches a key=value pair:
    echo("Key: ", matches[0])
    echo("Value: ", matches[1])
  elif line =~ re"\s*(\#.*)":
    # matches a comment
    # note that the implicit ``matches`` array is different from the
    # ``matches`` array of the first branch
    echo("comment: ", matches[0])
  else:
    echo("syntax error")