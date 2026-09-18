extends CharacterBody2D
 
## This is the speed, and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var lastinput = "Idle_Up"
func _physics_process(delta: float) -> void:
	var input := Input.get_vector("left", "right", "up", "down")
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	if Input.is_action_pressed("down") && Input.is_action_pressed("right"):
		sprite.play("Walking_Down_R")
		lastinput = "Idle_Down_R"
	elif Input.is_action_pressed("up") && Input.is_action_pressed("right"):
		sprite.play("Walking_Up_R")
		lastinput = "Idle_Up_R"
	elif Input.is_action_pressed("down") && Input.is_action_pressed("left"):
		sprite.play("Walking_Down_L")
		lastinput = "Idle_Down_L"
	elif Input.is_action_pressed("up") && Input.is_action_pressed("left"):
		sprite.play("Walking_Up_L")
		lastinput = "Idle_Up_L"
	elif Input.is_action_pressed("up"):
		sprite.play("Walking_Up")
		lastinput = "Idle_Up"
	elif Input.is_action_pressed("down"):
		sprite.play("Walking_Down")
		lastinput = "Idle_Down"
	elif Input.is_action_pressed("right"):
		sprite.play("Walking_Right")
		lastinput = "Idle_Right"
	elif Input.is_action_pressed("left"):
		sprite.play("Walking_Left")
		lastinput = "Idle_Left"

	else:
		sprite.play(lastinput)
	move_and_slide()
	
	
