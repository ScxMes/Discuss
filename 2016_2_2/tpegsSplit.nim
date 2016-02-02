import pegs

for word in split("00232this02939is39an22example111", peg"\d+"):
  writeLine(stdout, word)