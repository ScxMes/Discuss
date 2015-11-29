import nativesockets,net,posix

var serv_sock,clnt_sock:SocketHandle

var serv_addr,clnt_addr:Sockaddr_in

var clnt_addr_size:Socklen

var message:string="hello world"


serv_sock=newNativeSocket() 

if(serv_sock==SocketHandle(-1)):
  echo "生成无效的套接字"


serv_addr.sin_family=toInt(Domain.AF_INET)
serv_addr.sin_port=InPort(9190)
serv_addr.sin_addr.s_addr=posix.htonl(INADDR_ANY)

if(bindAddr(serv_sock,cast[ptr SockAddr](addr(serv_addr)),Socklen(sizeof(serv_addr)))== -1):
  echo "绑定错误"

if(nativesockets.listen(serv_sock,cint(5))== -1):
  echo "链接错误"

clnt_addr_size=Socklen(sizeof(clnt_addr))

clnt_sock=posix.accept(serv_sock,cast[ptr SockAddr](addr(clnt_addr)),addr(clnt_addr_size))

if(clnt_sock== SocketHandle(-1)):
  echo "无法接收链接"

var count = posix.write(cint(clnt_sock),pointer addr(message),sizeof(message))



close(clnt_sock)
close(serv_sock)
      

