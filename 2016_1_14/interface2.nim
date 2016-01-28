# Trait definition
interface Drawable* =
  drawType: int,
  preDraw: proc(self: pointer): bool {.nimcall.},
  draw: proc(self: pointer) {.nimcall.}

#########################
# COMPILATION UNIT 1
# ... same as before ...

#########################
# COMPILATION UNIT 2

import strutils

# Object implementing that trait
type Circle = object
  x, y, r : float

interface Drawable for Circle =
  let drawType = 5   # could also be var
  
  proc preDraw(circle: Circle): bool =
    echo("Pre-draw for circle (x: $1, y: $2, r: $3)")
    return circle.r != 0
  
  proc draw(circle: Circle) =
    echo(format("Drawing circle (x: $1, y: $2, r: $3)",
      circle.x, circle.y, circle.r))

# The drawing engine would be exposed.
var circle1 = Circle(x: 0, y: 0, r: 1)
var circle2 = Circle(x: 0, y: 0, r: 0)
engine.addDrawable(Drawable(circle1))
# NOTE: auto-cast to Drawable fat-pointer
engine.addDrawable(circle2)

#########################
# This would be called eventually within the engine itself.
engine.drawObjects()