class_name Npc
extends RigidBody2D

signal _chat_finish()

export (bool) var _flip_npc


func _ready():
	if _flip_npc:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false


func chat(source_position, dialog_box):
	emit_signal("_chat_finish")


func set_npc_direction(source_position):
	if source_position.x < position.x:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
