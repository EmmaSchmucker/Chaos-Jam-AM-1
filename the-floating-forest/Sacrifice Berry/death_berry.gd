extends Node2D

@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "Sacrifice")

#what you want to happen when you sacrifice.
func _Sacrifice():
	pass
