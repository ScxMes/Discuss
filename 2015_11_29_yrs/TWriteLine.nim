import streams

var
  ss = newStringStream("123456789")

echo ss.readAll()
echo ss.getPosition()
ss.setPosition(1)

ss.writeLine("")    ##writeLine过程写字符串是从 pos 指向的位置开始，覆盖之后的字符串，最后在写入换行符 write(s, "\n")，"\n"占两个字符。
                    ##如果在字符串中间写数据，总长度不变。如果pos 指向末尾，则写入的数据添加到字符串后面。
ss.setPosition(0)   ##字符串流的 pos 索引从0开始
echo ss.readAll()
echo ss.getPosition()

ss.writeLine("abc") ##
ss.setPosition(0)   
echo ss.readAll()
echo ss.getPosition()
