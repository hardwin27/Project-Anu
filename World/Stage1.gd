extends Stage

onready var _anim_player = $AnimationPlayer
onready var _little_girl = $LittleGirl
onready var _noticing_the_girl = $NoticingTheGirl
onready var _earthquake_starts = $EarthquakeStarts

var _little_girl_path = "res://Character/LittleGirl.tscn"

func _ready():
	_player.set_current_state("ON_CUTSCENE")
	_little_girl._anim_player.play("Sad")


func _unhandled_key_input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func _on_NoticingTheGirl_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	_dialog_box.append_text("Kyoko: This place is weird...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ???[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: What's wrong with that little girl?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: HEY, YOU OK?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("???: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmmm...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	_noticing_the_girl.queue_free()


func _on_EarthquakeStarts_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	_dialog_box.append_text("Kyoko: Hmmm... What a weird place. [break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: What's that weird thing there?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmmm it might come in handy...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("EarthquakeStarts")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: Wh... What was that?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	_earthquake_starts.queue_free()


func first_time_entering_dream():
	_player._anim_player.play("FirstTimeEnteringDream")


func objective_collected(objective_name):
	_player.set_current_state("ON_CUTSCENE")
	_player._anim_player.play("Idle")
	if objective_name == "Note":
		first_note_found()


func first_note_found():
	_dialog_box.append_text("Kyoko: Hmmm, what is this? A note?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmmmm, it seems like some kind of poem or lyric[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Whose note is this?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ..Somehow it seems familiar...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl.set_found_first_note(true)
	_player.set_current_state("IDLE")
