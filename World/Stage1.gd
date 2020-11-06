extends Stage

onready var _noticing_the_girl = $NoticingTheGirl
onready var _little_girl = $LittleGirl

func _ready():
	_player.set_current_state("ON_CUTSCENE")
	_little_girl._anim_player.play("Sad")


func _unhandled_key_input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func first_time_entering_dream():
	_player._anim_player.play("FirstTimeEnteringDream")


func _on_NoticingTheGirl_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	_dialog_box.append_text("This place is weird...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("???[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("What's wrong with that little girl?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("HEY, YOU OK?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hmmm...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	_noticing_the_girl.queue_free()
