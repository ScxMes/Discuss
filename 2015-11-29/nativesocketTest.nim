import nativesockets,net


#type
#  Port* = distinct uint16  ## port type


var p1,p2:Port
p1=25.Port
p2=25.Port

echo"ok"
#echo (`==`(p1,p2))      # 以调用过程的方式调用
echo(`==`(p1,p2))
echo(p1==p2)

echo ($p1)
echo `$`p1

#domain:套接字中使用的协议族(protocol family)信息

var 
   domainTest:Domain
   sockTest:SockType
   proTest:Protocol

domainTest=AF_INET
sockTest=SOCK_STREAM
proTest=IPPROTO_TCP

echo toInt(domainTest)

echo toInt(sockTest)

echo toInt(proTest)
