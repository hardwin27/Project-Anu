extends Character

onready var _anim_player = $AnimationPlayer
onready var _appearance = $Appearance
onready var _dialog_box = $BlockingDialogBox
onready var _attack_area = $AttackArea
onready var _placing_area = $PlacingArea
onready var _camera = $Camera2D
onready var _world = get_parent()
onready var _item_preview = null

var _health = 200
var _can_cayote_jump = true
var _jump_was_pressed = false
var _npc = null
var _can_interact_with_object = false
var _interact_with_object_func = null
var _is_attacked = 0
var _inventory = [null, null, null]
var _inventory_index = 0

func _ready():
	set_physics_process(true)
	print("inventory_index: %s" % _inventory_index)


func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if _can_interact_with_object:
			_interact_with_object_func.call_func()
		
		if _npc != null:
			_anim_player.play("Idle")
			_current_state = ON_CUTSCENE
			_npc.chat(position, _dialog_box)
			yield(_npc, "_chat_finish")
			_current_state = IDLE
	
	if event.is_action("Attack") and _current_state != PLACE_ITEM:
		_anim_player.play("Attack")
		_current_state = ATTACK
	
	if event.is_action("Attack") and _current_state == PLACE_ITEM:
		if _item_preview != null:
			if _item_preview.can_spawn():
				_current_state = IDLE
				_anim_player.play("Idle")
				place_item()
				delete_item_preview()
	
	if event.is_action_pressed("place_item"):
		_current_state = PLACE_ITEM
		_anim_player.play("PlaceItem")
		show_item_preview()
	
	if event.is_action_released("place_item"):
		_current_state = IDLE
		_anim_player.play("Idle")
		delete_item_preview()
	
	if event.is_action_pressed("inventory_0"):
		change_inventory_index(0)
		print("inventory_index: %s" % _inventory_index)
	
	if event.is_action_pressed("inventory_1"):
		change_inventory_index(1)
		print("inventory_index: %s" % _inventory_index)
	
	if event.is_action_pressed("inventory_2"):
		change_inventory_index(2)
		print("inventory_index: %s" % _inventory_index)


func _physics_process(delta):
	var direction = get_direction()
	if _current_state != ON_CUTSCENE:
		if direction > 0:
			_appearance.scale.x = 1
			_attack_area.scale.x = 1
			_placing_area.scale.x = 1
		elif direction < 0:
			_appearance.scale.x = -1
			_attack_area.scale.x = -1
			_placing_area.scale.x = -1
	if _current_state == IDLE or _current_state == WALK:
		if direction == 0:
			_current_state = IDLE
			_anim_player.play("Idle")
		else:
			_current_state = WALK
			_anim_player.play("Walk")
		if _is_attacked > 0:
			_motion.x = -direction * _speed
			_is_attacked -= 1
		else:
			_motion.x = direction * _speed
		
		if Input.is_action_just_pressed("jump"):
			_jump_was_pressed = true
			remember_jump()
			if _can_cayote_jump:
				_motion.y = _jump_height
	
		if is_on_floor():
			_can_cayote_jump = true
			if _jump_was_pressed:
				_motion.y = _jump_height
		else:
			cayote_jump()
			_motion.y += _gravity
	
	else:
		_motion = Vector2.ZERO
			
	_motion = move_and_slide(_motion, Vector2.UP, false, 4, PI/4, false)


func _on_InteractionArea_body_entered(body):
	_npc = body


func _on_InteractionArea_body_exited(body):
	_npc = null


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack":
		_current_state = IDLE
	elif anim_name == "FirstTimeEnteringDream":
		_dialog_box.append_text("Kyoko: ...What the hell?[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_dialog_box.append_text("Kyoko: Where the f am i?[break]", 100)
		yield(_dialog_box, "break_ended")
		_dialog_box.hide_box()
		_current_state = IDLE


func _on_AttackArea_body_entered(body):
	body.damaged(25)


func _on_PickupArea_body_entered(body):
	var selected_index = null
	if body.is_in_group("Objective"):
		_world.objective_collected(body.name)
	else:
#		_inventory.append(body.duplicate())
		if _inventory[_inventory_index] == null:
			selected_index = _inventory_index
		else:
			selected_index = _inventory.find(null)
		
		if selected_index != null and selected_index != -1:
			print("inventory_index: %s" % selected_index)
			_inventory[selected_index] = body.duplicate()
			body.queue_free()


func _on_PlayerHitArea_area_entered(area):
	_is_attacked = 20
	_health -= 20
	print(_health)
	if _health <= 0:
		var camera = Camera2D.new()
		_world.add_child(camera)
		camera.position = get_global_position()
		camera.current = true
		queue_free()


func _on_PlayerHitArea_body_entered(body):
	body.queue_free()
	_health -= 20
	print(_health)
	if _health <= 0:
		var camera = Camera2D.new()
		_world.add_child(camera)
		camera.position = get_global_position()
		camera.current = true
		queue_free()
		

func get_direction():
	return  Input.get_action_strength("move_right") - Input.get_action_strength("move_left")


func remember_jump():
	yield(get_tree().create_timer(0.2), "timeout")
	_jump_was_pressed = false


func cayote_jump():
	yield(get_tree().create_timer(0.2), "timeout")
	_can_cayote_jump = false


func place_item():
	if _inventory[_inventory_index] != null:
		var item = load(_inventory[_inventory_index].get_item()).instance()
		_world.add_child(item)
		item.set_global_position(_placing_area.get_node("PlacingPosition").get_global_position())
		_inventory[_inventory_index] = null
		print("inventory_index: %s" % _inventory_index)


func show_item_preview():
	if _inventory[_inventory_index] != null:
		var item = load(_inventory[_inventory_index].get_item()).instance()
		_item_preview = load(item.get_preview_path()).instance()
		_placing_area.add_child(_item_preview)
		_item_preview.set_global_position(_placing_area.get_node("PlacingPosition").get_global_position())
		print(_item_preview)
		print("inventory_index: %s" % _inventory_index)


func delete_item_preview():
	if _item_preview != null:
		print("DELETE")
		_item_preview.queue_free()


func change_inventory_index(index):
	_inventory_index = index
	if _current_state == PLACE_ITEM:
		delete_item_preview()
		show_item_preview()


func set_interact_with_object_func(function):
	_interact_with_object_func = function
	_can_interact_with_object = true


func remove_interact_with_object_func():
	_interact_with_object_func = null
	_can_interact_with_object = false


func get_dialog_box():
	return _dialog_box


func shake_screen(amount):
	_camera.add_trauma(amount)
