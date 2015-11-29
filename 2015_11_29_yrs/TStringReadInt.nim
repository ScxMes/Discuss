import streams

var
  ss = newStringStream("00100023456789012345")
  
echo ss.readInt8()
echo ss.getPosition() 

echo ss.readInt16()    #读取两个字节，后读取的在高位，#注意大端小端，此处为小端
echo ss.getPosition()   #返回ASCII码转换为整型。10 返回12337

echo ss.readInt32()
echo ss.getPosition()

echo ss.readInt64()
echo ss.getPosition()

echo "=================================="
var 
  ss2 = newStringStream("01")

echo ss2.readInt16()
echo ss2.getPosition()

