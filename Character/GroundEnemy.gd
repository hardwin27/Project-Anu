extends Character

onready var _anim_player = $AnimationPlayer
onready var _sprite = $Sprite
onready var _detection_area = $DetectionArea
onready var _health_bar = $HealthBar

var _health = 50
var _player = null
var _is_attacked = 0


func _ready():
	set_physics_process(true)
	_speed = 100


func _physics_process(delta):
	if not is_on_floor():
		_motion.y += _gravity
	if _current_state == IDLE:
		_motion.x = 0
	else:
		var direction = get_direction()
		if _is_attacked > 0:
			_motion.x = -direction * _speed
			_is_attacked -= 1
		else:
			_motion.x = direction * _speed
	_motion.y = move_and_slide(_motion, Vector2.UP).y


func _on_DetectionArea_body_entered(body):
	_player = body
	_current_state = WALK
	_anim_player.play("Walk")
	


func _on_DetectionArea_body_exited(body):
	_player = null
	_current_state = IDLE
	_anim_player.play("Idle")


func damaged(damage):
	_health -= damage
	_health_bar.update_health(_health)
	_is_attacked = 20
	if _health <= 0:
		queue_free()


func get_direction():
	if abs(_player.get_global_position().x - get_global_position().x) < 20:
		return 0
	if _player.get_global_position().x > get_global_position().x:
		_sprite.scale.x = 1
		_detection_area.scale.x = 1
		return 1
	elif _player.get_global_position().x < get_global_position().x:
		_sprite.scale.x = -1
		_detection_area.scale.x = -1
		return -1
