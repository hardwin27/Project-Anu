extends Stage

onready var _door_to_bedroom = $DoorToBedroom
onready var _door_to_livingroom = $DoorToLivingroom
onready var _anim_player = $AnimationPlayer

var _is_music_playing = false
var _is_first_interaction_with_bed = true
var _next_scene_path = "res://World/Stage1.tscn"


func _ready():
	_player.set_current_state("ON_CUTSCENE")
	_ui.play_transition("in")
	yield(_ui._anim_player, "animation_finished")
	_anim_player.play("ImHome")
	


func _unhandled_key_input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func _on_DoorToBedroom_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "go_to_bedroom"))


func _on_DoorToBedroom_body_exited(body):
	body.remove_interact_with_object_func()


func _on_DoorToLivingroom_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "go_to_livingroom"))


func _on_DoorToLivingroom_body_exited(body):
	body.remove_interact_with_object_func()


func _on_BedArea_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "interact_with_bed"))


func _on_BedArea_body_exited(body):
	body.remove_interact_with_object_func()


func _on_ComputerArea_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "interact_with_computer"))


func _on_ComputerArea_body_exited(body):
	body.remove_interact_with_object_func()


func im_home():
	print("Today's")
	_dialog_box.append_text("Kyoko: *Sigh*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: \"Finally I'm home...\"[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: \"Today's work was hell for sure…\"[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: \"I WANT TO SLEEP!!\"[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.set_current_state("IDLE")


func go_to_bedroom():
	_player.set_global_position(_door_to_livingroom.get_global_position())


func go_to_livingroom():
	_player.set_global_position(_door_to_bedroom.get_global_position())


func interact_with_bed():
	_player.set_current_state("ON_CUTSCENE")
	_player.play_animation("Idle")
	if not _is_music_playing:
		if _is_first_interaction_with_bed:
			_dialog_box.append_text("Kyoko: \"Good work for me today...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"I think I should sleep now.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Boss said that there will be extra work tomorrow, right?\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"I need to have a proper rest for tomorrow.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Hmm...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"I kinda want to hear some music while asleep.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"I think I should play some music on my PC.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_is_first_interaction_with_bed = false
		else:
			_dialog_box.append_text("Kyoko: \"I think I should play some on my PC.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
	else:
		_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"Man, Risu is sure amazing\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"We used to sing together whem we were in college.\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"We even uploaded some cover on MyTube.\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"...But she's sure a talented girl...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()  
		_dialog_box.append_text("Kyoko: \"Fully dedicate herself in singin, now she's a big shot artist...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"And here I am doing my 9 to 5 job.\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: *Sigh*[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"...I wish I have more confidence in my singing back then...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"...What am talking about...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"...let's just go to sleep...\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_ui.play_transition("out")
		yield(_ui._anim_player, "animation_finished")
		get_tree().change_scene(_next_scene_path)
	_player.set_current_state("IDLE")


func interact_with_computer():
	_player.set_current_state("ON_CUTSCENE")
	_player.play_animation("Idle")
	if _is_first_interaction_with_bed:
		_dialog_box.append_text("Kyoko: \"Urgghh, i kinda did a lot of work behind computer today.\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: \"I think it's better for me to stay away from my PC for now.\"[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
	else:
		if not _is_music_playing:
			_dialog_box.append_text("Kyoko: \"Hmm... Let's see what's on my Dotify...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Hoo, The Quintuplets just release a new song , White Rose!\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Oh, is this the new song from ExclusiveFor, The Song of Phoenix and Grim Reaper?\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"!?\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Risu just uploaded a new song?\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Man, that's quite a good song.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"She's sure a big hit now...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_dialog_box.append_text("Kyoko: \"Aight, time go go to sleep.\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
			_is_music_playing = true
		else:
			_dialog_box.append_text("Kyoko: \"I think I'll leave the music on...\"[break]", 100)
			yield(_dialog_box, "break_ended")
			_dialog_box.hide_box()
	_player.set_current_state("IDLE")
