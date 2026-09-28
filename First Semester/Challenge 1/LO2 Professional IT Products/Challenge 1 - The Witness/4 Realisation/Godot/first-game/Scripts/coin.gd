extends Area2D
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


#This is for connect the sign body_entered which its triggerd whanever fisics body enters the area
func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
