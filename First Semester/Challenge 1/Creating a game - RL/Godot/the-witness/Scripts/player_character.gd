extends CharacterBody2D
 
## This is the speed,acceleration and friction and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var base_speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var lastinput = "Up"
var is_crouching = false #Saves if the character is crouch
var current_state = "Idle_Up"

func _physics_process(delta: float) -> void:
	# 1. Detect movement entries
	var input := Input.get_vector("left", "right", "up", "down")
	print(input.sign())
	
	# Modo Mantener: is_crouching sera True solo mientras mantenga pulsado el Control
	is_crouching = Input.is_action_pressed("crouch")
	var current_speed = base_speed
	var state = "Walking"
	
	if is_crouching:
		state = "Crouch"
		current_speed = base_speed * 0.5 #It walks slower if the player is crouch
	elif Input.is_action_pressed("shift"):
		state = "Running"
		current_speed = base_speed * 5 #Calculates de base speed and multiplies per 5 to Run
	
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * current_speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	move_and_slide()
	
	# 2. SECCIÓN DE ANIMACIONES
	if input != Vector2.ZERO:
		var dir_key = Vector2i(input.sign())
		var dir_suffix := ""
	
		match dir_key:
			Vector2i(1, 0): dir_suffix = "Right"
			Vector2i(-1, 0): dir_suffix = "Left"
			Vector2i(0, -1): dir_suffix = "Up"
			Vector2i(0, 1): dir_suffix = "Down"
			Vector2i(1, -1): dir_suffix = "Up_Right"
			Vector2i(1, 1):  dir_suffix = "Down_Right"
			Vector2i(-1, -1): dir_suffix = "Up_Left"
			Vector2i(-1, 1): dir_suffix = "Down_Left"
			_: dir_suffix = "Down"

		lastinput = dir_suffix
		sprite.play(state + "_" + dir_suffix)
	
	else: # <--- ¡ESTA ES LA PALABRA CLAVE QUE FALTABA!
		# Si el input es igual a cero (el jugador no se mueve), maneja el Idle:
		if is_crouching:
			sprite.play("Crouch_Idle_" + lastinput)
		else: 
			sprite.play("Idle_" + lastinput)
