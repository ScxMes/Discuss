#windows，Linux下出现不同情况，Linux下输入足够字符串，会一下子读完。
#m.flush()好像没作用。Windows 不是这样。
import streams
var 
  x:int8
  y:char
  z:string
  m:FileStream

m = newFileStream(stdin)

x = m.readInt8()
m.flush()
y = m.readChar()
m.flush()
z = m.readStr(3)

echo "x = ",x
echo "y = ",y
echo "z = ",z
