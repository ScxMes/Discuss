#这个程序是把使用标准输入文件流或字符串流读取的整型转换为原来的字符串。注意后读取的字符的二进制在高位。

import streams

proc StreamReadIntToString[T](strInt:T, size:int):string =
  ##strInt是从文件流读取的整型，stdin.readInt16()
  ##size是字节数
  
  var 
    temp = strInt
    judge = size
    singleChar:char
    singleInt:int
    result = ""

  while(judge > 0) :
    judge = judge - 1  
    singleInt = temp shr ((size - 1)*8)       #整型右移 (size-1)*8 位，剩余最高八位。
    singleChar = char(singleInt)              #把最高8位转换为char型
    result = singleChar & result              #小端在前，大端在后

    if judge > 0:
      temp = temp shl (8)                   #左移读取过的高8位
    else:
      return result

var 
  fs = newFileStream(stdin)
  ss = newStringStream("0123456789")
  strInt1:int32
  strInt2:int32

strInt1 = fs.readInt32()
strInt2 = ss.readInt32()


echo "strInt1 =  ",StreamReadIntToString(strInt1,sizeof(type(strInt1))) 
echo "strInt2 =  ",StreamReadIntToString(strInt2,sizeof(type(strInt1)))



