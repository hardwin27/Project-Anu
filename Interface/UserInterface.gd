extends Control

signal _revived

onready var _slots = [$Slot0, $Slot1, $Slot2]
onready var _dead_layer = $CanvasLayer/DeadLayer

var _selected_slot = 0


func _ready():
	select_slot()


func change_slot(index):
	_selected_slot = index
	select_slot()


func update_slot(index, preview):
	if preview == null:
		_slots[index].get_node("Sprite").queue_free()
	else:
		preview.scale.x = 0.5
		preview.scale.y = 0.5
		var slot = _slots[index]
		slot.add_child(preview)
		preview.set_global_position(slot.get_node("PreviewPosition").get_global_position())


func select_slot():
	for index in range(0, 3):
		if index == _selected_slot:
			_slots[index].modulate.a8 = 255
		else:
			_slots[index].modulate.a8 = 100


func player_dead():
	_dead_layer.visible = true


func _on_YesButton_button_up():
	_dead_layer.visible = false
	emit_signal("_revived")
