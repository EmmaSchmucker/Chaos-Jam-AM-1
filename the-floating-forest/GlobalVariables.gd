extends Node

var Party

# A Character is a Storage Class that has global info about the
# character and its health, ect.

# The GenerateCharacter function takes in a dictionary that has
# some general data about the character and auto creates some
# data like MaxHealth and MaxMana.

# The Character can then be obtained by doing 
# GlobalVariables.Party["characterName"] or GlobalVariables.Party.characterName
# This can be done from anywhere in the code.
func GenerateCharacter(characterDictionary):
	characterDictionary.MaxHealth = characterDictionary.Health
	characterDictionary.MaxMana = characterDictionary.Mana
	return characterDictionary

func CreateParty():
	var Fox = GenerateCharacter({
		Name = "Fox",
		Health = 50,
		Mana = 25,
		Attack = 4,
		RoundMana = 5,
	})
	
	var Rabbit = GenerateCharacter({
		Name = "Rabbit",
		Health = 75,
		Attack = 5,
		Mana = 24,
		RoundMana = 4
	})
	
	var Frog = GenerateCharacter({
		Name = "Frog",
		Health = 35,
		Attack = 3,
		Mana = 21,
		RoundMana = 7
	})
	
	var Bird = GenerateCharacter({
		Name = "Bird",
		Health = 60,
		Attack = 8,
		Mana = 24,
		RoundMana = 4
	})
	
	Party = {
		Fox = Fox,
		Rabbit = Rabbit,
		Frog = Frog,
		Bird = Bird
	}

func _init() -> void:
	CreateParty()

func GetParty():
	if (Party == null):
		CreateParty()
	return Party
