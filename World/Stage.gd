class_name Stage
extends Node2D

onready var _player = $Player
onready var _dialog_box = _player.get_dialog_box()


func spawn_drop_item(drop_position, dropped_item_path):
	var dropped_item = load(dropped_item_path).instance()
	add_child(dropped_item)
	dropped_item.set_global_position(drop_position)
