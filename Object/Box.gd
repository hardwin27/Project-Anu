extends RigidBody2D

onready var _parent_node = get_parent()

export (String) var _dropped_item_path
export (String) var _preview_path

var _health = 100


func damaged(damage):
	_health -= damage
	if _health <= 0:
		print(_dropped_item_path)
		_parent_node.spawn_drop_item(get_global_position(), _dropped_item_path)
		queue_free()


func get_preview_path():
	return _preview_path
