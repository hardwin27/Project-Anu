extends TextureButton

export(String, FILE) var _next_scene_part


func _on_PlayButton_button_up():
	get_tree().change_scene(_next_scene_part)
