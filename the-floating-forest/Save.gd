extends Node
#where the variables are being saves 
var save_path = "user://variable.save"

##what things need to be saved. AKA, the variables of each character 
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(GlobalVariables.GetParty().Fox)
	file.store_var(GlobalVariables.GetParty().Rabbit)
	file.store_var(GlobalVariables.GetParty().Frog)
	file.store_var(GlobalVariables.GetParty().Bird)
		

##what things need to be loaded FROM the save (add more later like berries saved?)
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		GlobalVariables.GetParty().Fox = file.get_var(GlobalVariables.GetParty().Fox)
		GlobalVariables.GetParty().Rabbit = file.get_var(GlobalVariables.GetParty().Rabbit)
		GlobalVariables.GetParty().Frog = file.get_var(GlobalVariables.GetParty().Frog)
		GlobalVariables.GetParty().Bird = file.get_var(GlobalVariables.GetParty().Bird)
	else:
		print("no data saved")
	##going to need a delete function where data is reverted to what it is the first time the game is played
	
