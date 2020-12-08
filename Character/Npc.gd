class_name Npc
extends KinematicBody2D

onready var _appearance = $Appearance

var _motion = Vector2.ZERO

signal _chat_finish()

export (bool) var _flip_npc


func _ready():
	if _flip_npc:
		_appearance.scale.x = -1
	else:
		_appearance.scale.x = 1


func _physics_process(delta):
	if is_on_floor():
		_motion = Vector2.ZERO
	else:
		_motion.y += 40
	_motion = move_and_slide(_motion, Vector2.UP)


func chat(source_position, dialog_box):
	emit_signal("_chat_finish")


func set_npc_direction(source_position):
	if source_position.x < get_global_position().x:
		_appearance.scale.x = -1
	else:
		_appearance.scale.x = 1
