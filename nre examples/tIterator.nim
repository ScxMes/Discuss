import nre, options

var
  str = "yrs 123 wh3 dd9 1"
  regex1 = re"([a-zA-Z_][a-zA-Z_0-9]*)\s*(\d*)"

echo findAll(str, regex1)

for sub in findIter(str, regex1):            #迭代器findIter 迭代返回str匹配的regexMatch对象
  echo sub.match()
  for i in items(sub.captures):             #迭代器 items 迭代返回匹配捕获的子字符串
    echo "items captures =>>> ", i
 
  for j in items(sub.captureBounds):        #迭代器 items 迭代返回匹配捕获的子字符串的位置
    echo "items Bounds =>>> ", j