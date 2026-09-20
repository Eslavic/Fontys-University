extends CharacterBody2D
 
## This is the speed,acceleration and friction and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var base_speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
# We create a list organized by states:
enum State { IDLE, WALKING, RUNNING, CROUCHING}
var curren_state = State.IDLE
var lastinput = "Idle_Up"
var is_crouching = false #Saves if the character is crouch
func _physics_process(delta: float) -> void:
	# 1. Detect movement entries
	var input := Input.get_vector("left", "right", "up", "down")
	
	# Modo Mantener: is_crouching sera True solo mientras mantenga pulsado el Control
	is_crouching = Input.is_action_pressed("crouch")
	var current_speed = base_speed
	var _state = "walking"
	if is_crouching:
		_state = "Crouching"
		current_speed = base_speed * 0.5 #It walks slower if the player is crouch
	elif Input.is_action_pressed("shift"):
		_state = "Running"
		current_speed = base_speed * 5 #Calculates de base speed and multiplies per 1.6 to Run
	
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * current_speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()
	
