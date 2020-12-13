class_name Stage
extends Node2D

onready var _player = $Player
onready var _dialog_box = _player.get_dialog_box()
onready var _ui = $UI/UserInterface
onready var _spawn_node = $ObjectSpawned


func _ready():
	_player.connect("_change_inventory", _ui, "change_slot")
	_player.connect("_update_slot", _ui, "update_slot")
	_player.connect("_dead", _ui, "player_dead")
	_ui.connect("_revived", _player, "revived")
	_ui.change_slot(_player._inventory_index)


func spawn_drop_item(drop_position, dropped_item_path):
	var dropped_item = load(dropped_item_path).instance()
	_spawn_node.add_child(dropped_item)
	dropped_item.set_global_position(drop_position)
