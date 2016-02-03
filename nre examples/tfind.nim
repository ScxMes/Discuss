import nre, options

echo "foo".find(re"f").get()     #get() 过程在模块options中，用于得到Option对象中的字段val
echo "foo".find(re"o")      #find能匹配到 o, 而match不能


var
  str = "yrs 123 wh3 dd9 1"
  regex1 = re"[a-zA-Z_][a-zA-Z_0-9]*"
  optionRegexMatch: Option[RegexMatch]
  regexMatch1: RegexMatch
  

optionRegexMatch = find(str, regex1)
regexMatch1 = optionRegexMatch.get()
echo($regexMatch1)

echo regexMatch1.match()
echo regexMatch1.matchBounds()