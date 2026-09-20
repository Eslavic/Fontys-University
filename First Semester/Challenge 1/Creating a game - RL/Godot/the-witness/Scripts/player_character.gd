extends CharacterBody2D
 
## This is the speed,acceleration and friction and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var base_speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var lastinput = "Idle_Up"
var is_crouching = false #Saves if the character is crouch

func _physics_process(delta: float) -> void:
	# 1. Detect movement entries
	var input := Input.get_vector("left", "right", "up", "down")
	
	# Modo Mantener: is_crouching sera True solo mientras mantenga pulsado el Control
	is_crouching = Input.is_action_pressed("crouch")
	var current_speed = base_speed
	if is_crouching:
		current_speed = base_speed * 0.5 #It walks slower if the player is crouch
	elif Input.is_action_pressed("shift"):
		current_speed = base_speed * 5 #Calculates de base speed and multiplies per 1.6 to Run
	
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * current_speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()
	
	if Input.is_action_pressed("down") && Input.is_action_pressed("right"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Down_R")
		else:			
			sprite.play("Walking_Down_R")
			lastinput = "Idle_Down_R"
	elif Input.is_action_pressed("up") && Input.is_action_pressed("right"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Up_R")
		else:
			sprite.play("Walking_Up_R")
			lastinput = "Idle_Up_R"
	elif Input.is_action_pressed("down") && Input.is_action_pressed("left"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Down_L")
		else:
			sprite.play("Walking_Down_L")
			lastinput = "Idle_Down_L"
	elif Input.is_action_pressed("up") && Input.is_action_pressed("left"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Up_L")
		else:
			sprite.play("Walking_Up_L")
			lastinput = "Idle_Up_L"
	elif Input.is_action_pressed("up"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Up")
		else:
			sprite.play("Walking_Up")
			lastinput = "Idle_Up"
	elif Input.is_action_pressed("down"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Down")
		else:
			sprite.play("Walking_Down")
			lastinput = "Idle_Down"
		
	elif Input.is_action_pressed("right"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Right")
		else:
			sprite.play("Walking_Right")
			lastinput = "Idle_Right"
	elif Input.is_action_pressed("left"):
		if Input.is_action_pressed("shift"):
			sprite.play("Running_Left")
		else:
			sprite.play("Walking_Left")
			lastinput = "Idle_Left"
#	elif Input.is_action_pressed("shift") && Input.is_action_pressed("down"):
	#	sprite.play("Running_Down")
	#	lastinput = "Idle_Down"
	elif Input.is_action_pressed("shift") && Input.is_action_pressed("up"):
		sprite.play("Running_Up")
		lastinput = "Idle_Up"
	

	else:
		sprite.play(lastinput)
