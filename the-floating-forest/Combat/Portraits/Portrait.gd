extends TextureRect

var HealthBar: ProgressBar
var ManaBar: ProgressBar

# Was AliveTexture and DeadTexture, I changed it due to it causeing a error in CombatUI.GD with AliveImage looks like it
# Looks like it fixed it but I just metioning if it needs to be reverted.
var AliveImage: Texture2D
var DeadImage: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HealthBar = get_node("HealthBar")
	ManaBar = get_node("ManaBar")
