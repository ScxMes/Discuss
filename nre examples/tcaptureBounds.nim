import nre, options

echo "abc".match(re"(\w)").get().captureBounds[0].get() == 0 .. 0
echo "abc".match(re"").get().captureBounds[-1]        # == 0 .. -1
echo "abc".match(re"abc").get().captureBounds[-1]     # == 0 .. 2