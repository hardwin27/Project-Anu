extends Camera2D

onready var _noise = OpenSimplexNoise.new()

var _decay = 0.2
var _max_offset = Vector2(100, 75)
var _max_roll = 0.1
var _trauma = 0.0
var _trauma_power = 2
var _noise_y = 0


func _ready():
	randomize()
	_noise.seed = randi()
	_noise.period = 4
	_noise.octaves = 2


func _process(delta):
	if _trauma:
		_trauma = max(_trauma - _decay * delta, 0)
		shake()


func add_trauma(amount):
	_trauma = min(_trauma + amount, 1.0)


func shake():
	var amount = pow(_trauma, _trauma_power)
	_noise_y += 1
	rotation = _max_roll * amount * _noise.get_noise_2d(_noise.seed, _noise_y)
	offset.x = _max_offset.x * amount * _noise.get_noise_2d(_noise.seed * 2, _noise_y)
	offset.y = _max_offset.y * amount * _noise.get_noise_2d(_noise.seed * 3, _noise_y)
