extends TextureRect

var HealthBar: ProgressBar
var ManaBar: ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HealthBar = get_node("HealthBar")
	ManaBar = get_node("ManaBar")
