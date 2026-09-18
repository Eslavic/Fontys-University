extends CharacterBody2D
 
## This is the speed, and with @export_range we are creating a var so we can
## change the speed withouth having to touch the code
@export_range(0, 1000) var speed := 60
@export var accel: float = 1200.0
@export var friction: float = 1400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var lastinput
func _physics_process(delta: float) -> void:
	var input := Input.get_vector("left", "right", "up", "down")
	if input != Vector2.ZERO:
		lastinput = input.angle()
		print(input.angle())
		velocity = velocity.move_toward(input * speed, accel * delta)
		sprite.play("Walking_Up")
	else:
		if lastinput:
			print("last")
			if is_equal_approx(lastinput, -0.785):
				print("W+D")
			elif lastinput == 0.78539818525314:
				print("S+D")
			elif lastinput == 2.35619449615479:
				print("S+A")
			elif lastinput == -2.35619449615479:
				print("A+W")
		
		
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		sprite.play("Idle_Right")
	move_and_slide()
	
	
