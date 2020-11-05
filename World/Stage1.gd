extends Stage

onready var _player = $Player
onready var _noticing_the_girl = $NoticingTheGirl

func _ready():
	pass
# 	_player.set_current_state("ON_CUTSCENE")


func _unhandled_key_input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func _on_NoticingTheGirl_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body.noticing_the_girl()
	_noticing_the_girl.queue_free()

