var
  siValue= ..(2,6)  #与下面的形式是等价的
  siValue2= 2..3    #以操作符的形式调用过程

assert(siValue is Slice)
assert(siValue2 is Slice)

siValue= ..(2,4)
var siValue3= (1,2,2)..(2,4,5)
var siValue4= (2..3)
echo siValue
echo siValue3
echo siValue4 is Slice
echo( (2..3) is Slice)
echo(sizeof(siValue))
echo(sizeof(siValue3))
echo(sizeof(siValue4))
var x:int
echo(sizeof(int))
echo(sizeof(2..4))

var siValue5:Slice[int8]
siValue5= (low(int8)-100)..(high(int8)+5)
echo siValue5