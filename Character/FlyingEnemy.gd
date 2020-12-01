extends Character

onready var _sprite = $Sprite
onready var _shooting_position = $ShootingPosition
onready var _attack_timer = $AttackTimer
onready var _world = get_parent()
onready var _health_bar = $HealthBar

var _player = null
var _should_chase = true
var _health = 25
var _projectile = preload("res://Object/Projectile.tscn")
var _projectile_speed = 250


func _ready():
	set_physics_process(true)
	_speed = 200


func _physics_process(delta):
	if _player != null:
		_shooting_position.look_at(_player.position)
		get_direction()
		if _should_chase:
			_motion = position.direction_to(_player.position) * _speed
			_motion = move_and_slide(_motion)


func _on_DetectionArea_body_entered(body):
	_player = body
	_attack_timer.start()


func _on_DetectionArea_body_exited(body):
	_player = null
	_attack_timer.stop()


func _on_StopChasingArea_body_entered(body):
	_should_chase = false


func _on_StopChasingArea_body_exited(body):
	_should_chase = true


func _on_AttackTimer_timeout():
	var projectile_instance = _projectile.instance()
	projectile_instance.position = _shooting_position.get_global_position()
	projectile_instance.rotation_degrees = _shooting_position.rotation_degrees
	projectile_instance.apply_impulse(Vector2(), Vector2(_projectile_speed, 0).rotated(_shooting_position.rotation))
	_world.add_child(projectile_instance)


func damaged(damage):
	_health -= damage
	_health_bar.update_health(_health)
	if _health <= 0:
		queue_free()


func get_direction():
	if _player.get_global_position().x > get_global_position().x:
		_sprite.scale.x = 1
	elif _player.get_global_position().x < get_global_position().x:
		_sprite.scale.x = -1


