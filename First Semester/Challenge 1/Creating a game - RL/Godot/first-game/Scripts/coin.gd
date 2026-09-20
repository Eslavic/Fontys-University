extends Area2D


#This is for connect the sign body_entered which its triggerd whanever fisics body enters the area
func _on_body_entered(body: Node2D) -> void:
	print("print") # Replace with function body.
	queue_free()
