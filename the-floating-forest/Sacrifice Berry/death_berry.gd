extends Node2D

@export var interaction_area: Area2D

func _ready():
	interaction_area.interact = Callable(self, "Sacrifice")
	print(interaction_area.interact)

#what you want to happen when you sacrifice.
func Sacrifice():
	print("die")
	
	#interaction_area.fox.queue_free() #this is just a funny, sacrifice should probably do something else lol
