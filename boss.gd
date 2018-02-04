extends KinematicBody2D

const UP = Vector2(0, -1)
var life = 20000

var motion = Vector2()
var direction = 1
var speed = 20

func _process(delta):
	motion.x = 10 * speed
	move_and_slide(motion * direction, UP)

func _on_Timer_timeout():
	speed = randi()%11+1
	if direction == 1:
		direction = -1
	else: 
		direction = 1
