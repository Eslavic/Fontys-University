extends CharacterBody2D

# We can change this atributes just changing the numbers
# Define two constants speed and velocity
const SPEED = 130.0 
const JUMP_VELOCITY = -300.0 
# We define the gravity bases on our project settings (default value = 980)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Physics(in general) engine need to update at fixed intervals to avoid janky behavior.
# _physics_process solve this problem it runs a fixed rate (60 t/s by default) 
# Is independed of ur game's actual frame rate and helps physics run smoothly.
# We use it:
	# - Anything that involves physics engine


func _physics_process(delta: float) -> void:
	# We add this animation here, so if is dead is true, it doesnt run anything else
	if is_dead:
		if animated_sprite.animation != "dead":
			animated_sprite.play("dead")
		return # it exits the function inmediatly
	# If the player is not standing on a surface we add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# If we press space bar and player its on a surface we jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()

	# Get the input direction:  -1, 0, 1 
	var direction := Input.get_axis("move left", "move right")
	
	# Flips the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jumping")	
	
	# Apply movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	move_and_slide()
