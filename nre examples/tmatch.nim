import nre , options


echo "abc".match(re"(\w)(\w)").get().captures[0]
echo "abc".match(re"(?<letter>\w)").get().captures["letter"]
echo "abc".match(re"(\w)\w").get().captures[-1]   #如果capturs里的Id是-1 ，那么返回所有匹配的子字符串