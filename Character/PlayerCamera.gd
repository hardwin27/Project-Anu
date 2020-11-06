extends Camera2D

var _decay = 0.8
var _max_offset = Vector2(100, 75)
var _max_roll = 0.1
var _trauma = 0.0
var _trauma_power = 2


func _ready():
	randomize()


func _process(delta):
	if _trauma:
		_trauma = max(_trauma - _decay * delta, 0)


func add_trauma(amount):
	_trauma = min(_trauma + amount, 1.0)


func shake():
	var amount = pow(_trauma, _trauma_power)
	rotation = _max_roll * amount * rand_range(-1, 1)
	offset.x = _max_offset.x * amount * rand_range(-1, 1)
	offset.y = _max_offset.y * amount * rand_range(-1, 1)
