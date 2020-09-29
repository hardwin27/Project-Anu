class_name Character
extends KinematicBody2D

enum STATES {
	IDLE, 
	WALK,
	GRAB
	}

export var motion = Vector2()
export var gravity = 40
export var jump_height = -800
export var speed = 400
var current_state = STATES.IDLE
