extends KinematicBody2D
const UP = Vector2(0, -1)
var motion = Vector2()
var jump_count = 0
var anim = "idle"
onready var player = get_node("Sprite")

func _process(delta):
	motion.y +=5
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 200
	elif Input.is_action_pressed("ui_left"):
		motion.x = -200
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			jump_count = 1
			motion.y = -300
		else:
			jump_count += 1
			if jump_count < 3:
				motion.y = -300
				
	# set animation
	if is_on_floor():
		if motion.x == 0:
			anim = "stand"
		else:
			anim = "walk"
	
	if motion.y < 0:
		anim = "jump"
		
	if motion.x > 0:
		player.set_flip_h(false)
	else: 
		player.set_flip_h(true)
		
	
	
	move_and_slide(motion, UP)
	player.play(anim)
	pass
