extends KinematicBody2D
const UP = Vector2(0, -1)
const MAX = 10000

var motion = Vector2()
var duration = 100
var direction = 1

func _process(delta):
	motion.x = 100 * direction
	move_and_slide(motion, UP)

func _on_Timer_timeout():
	if direction == -1:
		direction = 1
	else:
		direction = -1
