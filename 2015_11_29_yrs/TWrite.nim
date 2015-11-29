import streams

var
  ss = newStringStream("123456789")

ss.write("abc")    ##pos 指向字符串中间时写数据，覆盖原来字符，总长度不变。
ss.setPosition(0)
echo ss.readAll()

ss.write("def")    ##pos 指向末尾时写数据，字符串在末尾添加。
ss.setPosition(0)
echo ss.readAll()