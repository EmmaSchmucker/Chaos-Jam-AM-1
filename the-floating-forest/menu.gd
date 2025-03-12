extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/bird_island.tscn")

func _on_quit_button_up():
	get_tree().quit()

func _on_save_pressed():
	Save.save()

func _on_load_button_up():
	Save.load_data()

#func _on_delete_pressed():
	##add here once a delete function is made 
