var
  lastId = 0

template genId*: expr =
  inc(lastId)
  #lastId
  var a=1
  1
echo genId()