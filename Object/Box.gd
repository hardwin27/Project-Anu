extends RigidBody2D

onready var _parent_node = get_parent()

var _health = 100
var _dropped_item_path = "res://Object/DroppedBox.tscn"
var _preview_path = "res://Object/PreviewBox.tscn"


func damaged(damage):
	_health -= damage
	if _health <= 0:
		_parent_node.spawn_drop_item(get_global_position(), _dropped_item_path)
		queue_free()


func get_preview_path():
	return _preview_path
