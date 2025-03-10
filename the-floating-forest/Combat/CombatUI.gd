# HEY
# YOU
# I documented this script
# READ IT
# It will save you a lot of time making functions for things
# that I have already done

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

# Character and Index lookup let you go back
# and fourth between the index and the name
# of the characters:

# CharacterLookUp[IndexLookUp["Fox"]]
# "Fox" -> 0 -> "Fox"

var CharacterLookUp = {
	Fox = 0,
	Rabbit = 1,
	Frog = 2,
	Bird = 3
}

var IndexLookUp = [
	"Fox",
	"Rabbit",
	"Frog",
	"Bird"
]

# A lookup table, late initialized that can be indexed to
# get one of the four portraits.
var PortraitLookUp

# During the Player Phase, you can do an attack for each 
# of your alive party members. Who's turn it is at the 
# current moment is determined by the Turn variable.

# When it passes 3 that means everyone has gone and
# it is now the boss' turn.
var Turn = 0

# The Actions table should contain an array with two
# values: the action Name and the action Value

# Ex: Actions[0] = ["Attack", 10] where 10 is the damage
# that the Attack should do.

# YOU will have to use these actions to make a fight
# happen.
var Actions: Array[Array] = []

# The fight has two phases that go back and fourth:

# The Player phase, where you choose your attacks;
# The Attack phase, where the boss gets attacked;
# The Boss phase, where the boss attacks you;

# Fights always start with the Player phase unless
# specified in the StartFight function.
var Phase = FightPhase.Player

# The data for the Party
var Party
var CurrentCharacter

func SetupPortrait(portrait, memberName: String, aliveImage: Texture2D, deadImage: Texture2D):
	var partyMember = Party[memberName]
	
	var healthBar: ProgressBar = portrait.HealthBar
	var manaBar: ProgressBar = portrait.ManaBar
	
	portrait.AliveImage = aliveImage
	portrait.DeadImage = deadImage
	
	healthBar.max_value = partyMember.MaxHealth
	healthBar.value = partyMember.Health
	
	manaBar.max_value = partyMember.MaxMana
	manaBar.value = partyMember.Mana

# Meant to be ran at the beginning of the fight
# Sets up what needs to be set up
func StartFight(startPhase: FightPhase = FightPhase.Player):
	Phase = startPhase
	Turn = 0
	CurrentCharacter = Party["Fox"]
	Actions = []
	
	ChooseCharacter(CharacterLookUp[CurrentCharacter.Name])

# Gets a Character ready to have an attack
# Also gives them their Mana per turn
func ChooseCharacter(character: int):
	CurrentCharacter = IndexLookUp[character]
	var selectedPortrait = PortraitLookUp[character]
	
	CurrentCharacter.Mana = clamp(CurrentCharacter.Mana + CurrentCharacter.RoundMana, 0, CurrentCharacter.MaxMana)
	
	if (CurrentCharacter.Health <= 0):
		selectedPortrait.Texture = selectedPortrait.DeadTexture
		
		# Character must be dead, move on
		if (character+1 <= 3):
			ChooseCharacter(character + 1)
		else:
			PlayerAttack()
	else:
		selectedPortrait.Texture = selectedPortrait.AliveTexture

# This function should be ran when a Character does an attack
func AddAction(ActionName: String = "Attack", ActionValue = CurrentCharacter.Attack):
	Actions[Actions.size()] = [ActionName, ActionValue]

# This function should be ran once ALL of the characters
# have decided to do an attack.

# This controls the Attack Phase.
func PlayerAttack():
	pass
	
func SelectBoss():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Party = GlobalVariables.GetParty()
	
	BottomLeftPortrait = get_node("PartyPortraitBottomLeft")
	BottomRightPortrait = get_node("PartyPortraitBottomRight")
	TopLeftPortrait = get_node("PartyPortraitTopLeft")
	TopRightPortrait = get_node("PartyPortraitTopRight")
	
	PortraitLookUp = [
		BottomLeftPortrait,
		TopLeftPortrait,
		TopRightPortrait,
		BottomRightPortrait
	]
	
	# All of the icon.svgs are placeholders
	# Artists should replace them with normal images and then greyed
	# out images w/ whatever changes need to be added
	SetupPortrait(PortraitLookUp[0], "Fox", load("res://icon.svg"), load("res://icon.svg"))
	SetupPortrait(PortraitLookUp[1], "Rabbit", load("res://icon.svg"), load("res://icon.svg"))
	SetupPortrait(PortraitLookUp[2], "Frog", load("res://icon.svg"), load("res://icon.svg"))
	SetupPortrait(PortraitLookUp[3], "Bird", load("res://icon.svg"), load("res://icon.svg"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
