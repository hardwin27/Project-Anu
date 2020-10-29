extends KinematicBody2D

func chat(source_position, dialog_box):
	set_player_position(source_position)
	dialog_box.append_text("HELLO BOOOOOIIIIIIIIIIIIIIIi[break]", 50)
	yield(dialog_box, "break_ended")


func set_player_position(source_position):
	if source_position.x < position.x:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
