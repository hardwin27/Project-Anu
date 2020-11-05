extends Area2D

export (int, "OFF", "ON") var _state

onready var _anim_player = $AnimationPlayer
onready var _sprite = $Sprite
onready var _gate = get_parent()

var _is_switching = false


func _ready():
	if _state == 1:
		_sprite.frame = 2
	elif _state == 0:
		_sprite.frame = 0


func _on_Lever_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "switch_lever"))


func _on_Lever_body_exited(body):
	body.remove_interact_with_object_func()


func _on_AnimationPlayer_animation_finished(anim_name):
	_is_switching = false
	_gate.update_gate(_state)


func get_state():
	return _state


func switch_lever():
	if not _is_switching:
		_is_switching = true
		if _state == 1:
			_anim_player.play("LeftToRight")
			_state = 0
		elif _state == 0:
			_anim_player.play("RightToLeft")
			_state = 1


