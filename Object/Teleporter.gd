extends Area2D

export var _next_scene: PackedScene

var _can_teleport = false


func _on_Teleporter_body_entered(body):
	body.set_interact_with_object_func(funcref(self, "teleport"))


func _on_Teleporter_body_exited(body):
	body.remove_interact_with_object_func()


func teleport():
	if _can_teleport:
		get_parent()._ui.play_transition("out")
		yield(get_parent()._ui._anim_player, "animation_finished")
		get_tree().change_scene_to(_next_scene)


func set_can_teleport(value):
	_can_teleport = value
