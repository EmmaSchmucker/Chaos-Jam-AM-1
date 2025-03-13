extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass



#when player enters area
func _on_body_entered(_body: Node2D) -> void:
	InteractionManager.register_area(self)
#when player exists area
func _on_body_exited(_body: Node2D) -> void:
	InteractionManager.unregister_area(self)
