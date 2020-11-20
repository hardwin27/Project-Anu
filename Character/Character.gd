class_name Character
extends KinematicBody2D

enum {
	IDLE, 
	WALK,
	ATTACK,
	INTERACTING,
	PLACE_ITEM,
	ON_CUTSCENE
	}

export var _motion = Vector2()
export var _gravity = 40
export var _jump_height = -850
export var _speed = 400

var _current_state = IDLE


func set_current_state(state):
	match(state):
		"IDLE":
			_current_state = IDLE
		"WALK":
			_current_state = WALK
		"ATTACK":
			_current_state = ATTACK
		"INTERACTING":
			_current_state = INTERACTING
		"PLACE_ITEM":
			_current_state = PLACE_ITEM
		"ON_CUTSCENE":
			_current_state = ON_CUTSCENE
