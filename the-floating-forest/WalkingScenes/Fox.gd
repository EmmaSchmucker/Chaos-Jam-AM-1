extends CharacterBody2D

var follower_scene = preload("res://WalkingScenes/Follower.tscn")

const SPEED = 30000
@onready var Sprite = $AnimatedSprite2D
@export var Camera: Camera2D

func _ready() -> void:
	var party = GlobalVariables.GetParty()
	#print(party.Bird.Name)
	
	var previous_follower = self
	for follower in party:
		print(follower)
		if follower == "Fox":
			continue
		
		var new_follower = follower_scene.instantiate()
		new_follower.position = position
		new_follower.animal_string = follower
		new_follower.Target = previous_follower
		owner.add_child.call_deferred(new_follower)
		
		previous_follower = new_follower

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") # Since this has a limit of 1, movement is already normalized!
	# get_vector() is basically shorthand for 2 get_axis() calls. It gets the direction quick and easy
	velocity = direction * delta * SPEED
	move_and_slide()
