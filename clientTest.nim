import nativesockets,net,posix

var sock:SocketHandle

var serv_addr:Sockaddr_in


var message:string="abcd"
var addr:cstring="127.0.0.1"

sock=newNativeSocket() 

if(sock==SocketHandle(-1)):
  echo "生成无效的套接字"


serv_addr.sin_family=toInt(Domain.AF_INET)
serv_addr.sin_port=InPort(9190)
serv_addr.sin_addr.s_addr=posix.inet_addr(addr)



if(connect(sock,cast[ptr SockAddr](addr(serv_addr)),Socklen(sizeof(serv_addr)))== -1):
  echo "绑定错误"



var count = posix.read(cint(sock),pointer addr(message),sizeof(message)-1)

echo message

close(sock)




