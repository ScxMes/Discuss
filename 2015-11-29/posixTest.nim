import nativesockets



var 
   domainTest:Domain
   sockTest:SockType
   proTest:Protocol
   
   doaminT,sockT,proT:cint

domainTest=Domain.AF_INET
sockTest=SockType.SOCK_STREAM
proTest=Protocol.IPPROTO_TCP

doaminT=toInt(Domain.AF_INET)
sockT=toInt(SockType.SOCK_STREAM)
proT=toInt(Protocol.IPPROTO_TCP)

echo int(newNativeSocket())

echo int(newNativeSocket(Domain.AF_INET,SockType.SOCK_STREAM,Protocol.IPPROTO_TCP))

echo int(newNativeSocket(doaminT,sockT,proT))

