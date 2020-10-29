extends Area2D

export var _next_scene: PackedScene


func _on_Bed_body_entered(body):
	body.set_teleport_func(funcref(self, "teleport"))


func _on_Bed_body_exited(body):
	body.remove_teleport_func()


func teleport():
	get_tree().change_scene_to(_next_scene)
