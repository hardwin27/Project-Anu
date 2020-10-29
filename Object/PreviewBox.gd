extends Area2D

var _body_inside = 0


func can_spawn():
	if _body_inside == 0:
		return true
	else:
		return false


func _on_PreviewBox_body_entered(body):
	_body_inside += 1


func _on_PreviewBox_body_exited(body):
	_body_inside -= 1
