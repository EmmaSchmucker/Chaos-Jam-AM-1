extends CharacterBody2D

var follower_scene = preload("res://WalkingScenes/Follower.tscn")

const SPEED = 20000
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
	#print(direction)
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("walkleft")
	elif Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("walkright")
	elif Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("walkup")
	elif Input.is_action_just_pressed("ui_down"):
		$AnimatedSprite2D.play("walkdown")
	if direction == Vector2(0.707107,0.707107):
		direction = Vector2(0.5,0.5)
	elif direction == Vector2(-0.707107,0.707107):
		direction = Vector2(-0.5,0.5)
	elif direction == Vector2(-0.707107,-0.707107):
		direction = Vector2(-0.5,-0.5)
	elif direction == Vector2(0.707107,-0.707107):
		direction = Vector2(0.5,-0.5)
	velocity = direction * delta * SPEED
	if direction == Vector2(0,-1):
		$AnimatedSprite2D.play("walkup")
	elif direction == Vector2(0,1):
		$AnimatedSprite2D.play("walkdown")
	elif direction == Vector2(-1,0):
		$AnimatedSprite2D.play("walkleft")
	elif direction == Vector2(1,0):
		$AnimatedSprite2D.play("walkright")
	move_and_slide()
