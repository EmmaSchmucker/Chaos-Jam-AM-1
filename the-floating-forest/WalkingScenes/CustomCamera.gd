extends Camera2D

func scroll(player_x):
	if position.x < player_x: # go right
		position.x += 576 * 2
	else: # go left
		position.x -= 576 * 2
