extends Control


enum FightPhase {
	Player,
	Attack,
	Boss
}

var BottomLeftPortrait
var BottomRightPortrait
var TopLeftPortrait
var TopRightPortrait

# During the Player Phase, you can do an attack for each 
# of your alive party members. Who's turn it is at the 
# current moment is determined by the Turn variable.

# When it passes 3 that means everyone has gone and
# it is now the boss' turn.
var Turn = 0

# The fight has two phases that go back and fourth:

# The Player phase, where you choose your attacks;
# The Attack phase, where the boss gets attacked;
# The Boss phase, where the boss attacks you;

# Fights always start with the Player phase unless
# specified in the StartFight function.
var Phase = FightPhase.Player

# The data for the Party
var Party

func SetupPortrait(portrait, memberName: String):
	var partyMember = Party[memberName]
	
	var healthBar: ProgressBar = portrait.HealthBar
	var manaBar: ProgressBar = portrait.ManaBar
	
	healthBar.max_value = partyMember.MaxHealth
	healthBar.value = partyMember.Health
	
	manaBar.max_value = partyMember.MaxMana
	manaBar.value = partyMember.Mana

func StartFight(startPhase: FightPhase = FightPhase.Player):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Party = GlobalVariables.GetParty()
	
	BottomLeftPortrait = get_node("PartyPortraitBottomLeft")
	BottomRightPortrait = get_node("PartyPortraitBottomRight")
	TopLeftPortrait = get_node("PartyPortraitTopLeft")
	TopRightPortrait = get_node("PartyPortraitTopRight")
	
	SetupPortrait(BottomLeftPortrait, "Fox")
	SetupPortrait(TopLeftPortrait, "Rabbit")
	SetupPortrait(TopRightPortrait, "Frog")
	SetupPortrait(BottomRightPortrait, "Bird")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
