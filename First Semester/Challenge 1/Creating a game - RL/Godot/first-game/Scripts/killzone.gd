extends Area2D
@onready  var timer: Timer = $Timer

func _on_body_entered(_body: Node2D) -> void:	
	_body.is_dead = true
	print("You Died!")
	Engine.time_scale = 0.5
	$hurt.play()
	timer.start()
	return
	#_body.get_node("CollisionShape2D").queue_free()
	# With this we can add a sound when ur player enters in the killzone
	#we can apply this with other things, like jumping, falling... etc
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
