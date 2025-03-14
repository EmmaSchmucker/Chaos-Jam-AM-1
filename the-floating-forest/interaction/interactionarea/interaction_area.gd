extends Area2D
class_name InteractionArea

var fox: CharacterBody2D

@export var action_name: String = "interact"

var interact: Callable = func():
	pass

#when player enters area
func _on_body_entered(body: Node2D) -> void:
	InteractionManager.register_area(self)
	if body.name == "Fox":
		fox = body
		print(fox)
		
#when player exists area
func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregister_area(self)
