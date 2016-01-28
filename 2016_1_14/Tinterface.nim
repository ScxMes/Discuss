type  
  Person* = ref PersonObj
  PersonObj* = object of RootObj  
    speakImpl*: proc (p: Person)   
    eatImpl*: proc (p: Person)  
  
proc showSpeak*(p: Person) =   
  p.speakImpl(p)  
  
proc showEat*(p: Person) =   
  p.eatImpl(p)  
  
  
type  
  Chinese* = ref ChineseObj
  ChineseObj* = object of Person  
  
proc Cspeak*(p: Person) =  
  echo ("你好")  
proc Ceat*(p: Person) =   
  echo ("馒头")  
  
proc newChinese*(): Chinese =  
  new(result)
  result.speakImpl = Cspeak  
  result.eatImpl = Ceat  
  
  
type  
  American* = ref AmericanObj 
  AmericanObj* = object of PersonObj  
    
proc Aspeak*(p: Person) =   
  echo ("Hello")  
  
proc Aeat*(p: Person) =   
  echo ("hamburger")  
  
proc newAmerican*(): American =   
  new(result)
  result.speakImpl = Aspeak  
  result.eatImpl = Aeat  
  
  
  
var   
  varC = newChinese()  
  varA = newAmerican()  
  
varC.showSpeak()  
varA.showSpeak()  
varC.showEat()  
varA.showEat()  
varC.speakImpl(varC)