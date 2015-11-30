import streams,strutils

var 
  ss = newStringStream("0123456789")
  fs = newFileStream(stdin)
  x:int8
  y:int16

x = int8(parseInt(ss.readStr(sizeof(x))))
y = int16(parseInt(fs.readStr(sizeof(int16))))

echo "x = ", x
echo "y = ", y
