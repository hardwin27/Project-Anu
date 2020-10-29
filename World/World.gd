class_name Stage
extends Node2D


func spawn_drop_item(drop_position, dropped_item_path):
	var dropped_item = load(dropped_item_path).instance()
	add_child(dropped_item)
	dropped_item.set_global_position(drop_position)
