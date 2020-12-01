extends Node2D

onready var _bar = $Bar


func _ready():
	if get_parent():
		if get_parent().get("_health"):
			var health = get_parent().get("_health")
			_bar.max_value = health
			_bar.value = health


func update_health(value):
	_bar.value = value
