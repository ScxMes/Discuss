##注意 由于过程  flush() 在Linux 下好像没有作用，若用Linux测试该代码，则调用readInt 系列方法 单个使用。
##在windows 下过程 flush() 可以起作用，可以按照上面的readInt8，readInt16.....连续输入
##
##
##


import streams

proc newEIO(msg: string): ref IOError =
  new(result)
  result.msg = msg

proc pow(x, y: int): int {.importc: "pow", header: "<math.h>".}
  ##此过程返回的是 x 的 y 次方

proc readInt8(fs: FileStream): int8 =    
  ###从键盘读取一个数字字符，如果是负数，则读取两个字符。 范围 -9 ~ 9              
  var 
    tmp:int8
    sign:int8 = 1
  tmp = streams.readInt8(fs)
  if tmp == 45:                       #如果是负数，则在读取一个字符。
    sign = -1
    tmp = streams.readInt8(fs)
  elif tmp < 48 and tmp > 58:
    raise newEIO("Please input correct character!")
  result = (tmp -48) * sign

proc readInt16(fs: FileStream): int16 =          
  ###从键盘读取两个数字字符，如果是负数，则读取三个字符。 范围 -99 ~ 99      
  ## 注意本过程的实现与readInt32 和 readInt64 实现不一样。      
  var 
    tmp:int16
    add:int8

  tmp = streams.readInt16(fs)
  if(tmp and 0x00FF) == 45:
    add = streams.readInt8(fs)
    result = ((tmp shr 8)-48)*10 + (add - 48)
    result = result * -1
  else:
    result = (((tmp and 0x00FF) - 48)*10) + ((tmp shr 8) -48)

proc readInt32(fs: FileStream): int32 =
  ###从键盘读取四个数字字符，如果是负数，则读取五个字符。 范围 -9999 ~ 9999      
  ##   
  var 
    judge = sizeof(int32)
    tmp:int8
    sign:int32 = 1

  while judge>0:
    tmp = streams.readInt8(fs)
    if tmp == 45 :
      sign = -1
      continue
    tmp = tmp - 48
    result = result + int32(tmp * (pow(10,judge-1)))
    dec(judge)
  result = result * sign
  
proc readInt64(fs: FileStream): int64 =
  ###从键盘读取8个数字字符，如果是负数，则读取9个字符。 范围 -9999_9999 ~ 9999_9999      
  ##  
  var
    judge = sizeof(int64) 
    tmp: int8
    sign: int64 = 1
  while judge>0:
    tmp = streams.readInt8(fs)
    if tmp == 45 :
      sign = -1
      continue
    tmp = tmp - 48
    result = result + int32(tmp * (pow(10,judge-1)))
    dec(judge)
  result = result * sign
 


##############################################################################
var
  x:int8
  y:int16
  z:int32
  m:int64
  fs = newFileStream(stdin)


x = fs.readInt8()
fs.flush()
y = fs.readInt16()
fs.flush()
z = fs.readInt32()
fs.flush()
m = fs.readInt64()

echo x
echo y
echo z
echo m




