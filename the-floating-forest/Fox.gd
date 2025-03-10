extends CharacterBody2D

const SPEED = 30000
@onready var Sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down") # Since this has a limit of 1, movement is already normalized!
	# get_vector() is basically shorthand for 2 get_axis() calls. It gets the direction quick and easy
	velocity = direction * delta * SPEED
	move_and_slide()
