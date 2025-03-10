extends TextureRect

var HealthBar: ProgressBar
var ManaBar: ProgressBar

var AliveTexture: Texture2D
var DeadTexture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HealthBar = get_node("HealthBar")
	ManaBar = get_node("ManaBar")
