extends CharacterBody2D
 
## This is the speed,acceleration and friction and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var base_speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
# We create a list organized by states:
enum State { IDLE, WALKING, RUNNING, CROUCHING}
# We save our current_state in IDLE
var current_state = State.IDLE
var lastinput = "Idle_Up"
#var is_crouching = false #Saves if the character is crouch
func _physics_process(delta: float) -> void:
	# 1. Detect movement entries
	var input := Input.get_vector("left", "right", "up", "down")
	
	# Modo Mantener: is_crouching sera True solo mientras mantenga pulsado el Control
	#is_crouching = Input.is_action_pressed("crouch")
	var current_speed = base_speed
	if input == Vector2.ZERO:
		current_state = State.IDLE
	elif Input.is_action_pressed("crouch"):
		current_state = State.CROUCHING
	elif Input.is_action_pressed("shift"):
		current_state = State.RUNNING
	else:
		current_state = State.WALKING
		
	match current_state:
		State.IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		State.CROUCHING:
			current_speed = base_speed * 0.5 #It walks slower if the player is crouch
			velocity = velocity.move_toward(input * current_speed, accel * delta)
		State.WALKING:
			current_speed = base_speed
			velocity = velocity.move_toward(input * current_speed, accel * delta)
		State.RUNNING:
			#Calculates de base speed and multiplies per 5 to Run
			current_speed = base_speed * 5
			velocity = velocity.move_toward(input * current_speed, accel * delta)
	move_and_slide()
	# Convertimos el vector a enteros (Vector2i) con .sign() para que sea exacto (-1, 0 o 1)
	var dir_key = Vector2i(input.sign())
		
	match current_state:
		State.IDLE:
			sprite.play(lastinput)
		
		State.WALKING, State.RUNNING:
			var prefijo = "Walking_" if current_state == State.WALKING else "Running_"
			var anim_dir = ""

			
	
	
	
	
	
	#if is_crouching:
		#_state = "Crouching"
		
	#elif Input.is_action_pressed("shift"):
		#_state = "Running"
	#
	#if input != Vector2.ZERO:
		#velocity = velocity.move_toward(input * current_speed, accel * delta)
	#else:
		##velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	#move_and_slide()
	#
