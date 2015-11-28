import streams

var
  ss = newStringStream("""Theabcefg
the second line
the third line""")

echo ("是否在末尾: ",ss.atEnd())

#设置字段 pos 指向的位置
ss.setPosition(5)
#得到 pos 的位置
echo "pos 的位置: ",ss.getPosition()

#读取所有数据
echo ss.readAll()

#写数据
#var data = 2
#ss.write(data)
ss.write(" abc")
ss.setPosition(0)
echo ss.readAll()

echo "=============="
ss.setPosition(2)
ss.writeLine(1234)  ###############覆盖
ss.setPosition(0)
echo ss.readAll()

#读字符,pos 在移动
ss.setPosition(0)
echo ss.readChar()
echo ss.getPosition()

#读字符,pos 不移动
echo ss.peekChar()     ##注意过程为peek...() ，读取数据后 pos 不移动
echo ss.getPosition()

echo "++++++++++++++++++"
ss.data = "00"
echo sizeof(ss.data)
#echo ss.readBool()
echo ss.readInt16()
#echo ss.readInt16()
#echo ss.readInt32()
#echo ss.readInt64()
#echo ss.readFloat32()
#echo ss.readFloat64()
echo "++++++++++++++++"

discard """
#读指定长度字符串
ss.setPosition(0)
echo ss.readStr(0)

#读取一行数据
var line = ""
echo ss.readLine(line)
echo line

echo ss.readLine()
"""



