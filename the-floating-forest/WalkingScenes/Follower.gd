extends CharacterBody2D # The follower doesn't need collision, tbh

# The follower can either be the rabbit, frog, bird. This only changes their sprite, nothing else

var animal_string = "Not set"
const SPEED = 20000

@onready var Sprite = $AnimatedSprite2D
@onready var NavAgent = $NavigationAgent2D
@export var Target: CharacterBody2D # Keeps the followers in line.

func _ready() -> void:
	match animal_string: # match my beloved
		"Rabbit":
			modulate = Color(1, 0, 0)
		"Frog":
			modulate = Color(0, 1, 0)
		"Bird":
			modulate = Color(0, 0, 1)
	
	if animal_string != "Not set": # Just because the animations are not done yet
		if velocity != Vector2.ZERO:
			Sprite.play("Walk " + animal_string)
		else:
			Sprite.play("Idle " + animal_string)
	
	# Set the target position to the player's position
	NavAgent.target_position = Target.position # GlobalVariables.Player.position
	

func _physics_process(delta: float) -> void:
	NavAgent.target_position = Target.position # Constantly update the target position. Could be more efficient than activating every frame
	
	if NavAgent.is_navigation_finished(): # Don't go if the navigation is still doing...something
		return
	
	velocity = position.direction_to(NavAgent.get_next_path_position()).normalized() * SPEED * delta
	move_and_slide()
