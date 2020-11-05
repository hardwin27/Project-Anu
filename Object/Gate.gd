extends StaticBody2D

onready var _lever = get_node("Lever")
onready var _collision = $CollisionShape2D
onready var _sprite = $Sprite

var _state = null


func _ready():
	update_gate(_lever.get_state())


func update_gate(state):
	_state = state
	if _state == 1:
		_collision.disabled = true
		_sprite.visible = false
	elif _state == 0:
		_collision.disabled = false
		_sprite.visible = true
