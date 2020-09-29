extends Character

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite
onready var hand_position = $HandPosition

var attached = false
var joint = PinJoint2D.new()
var grabbing = false
var can_cayote_jump = true
var jump_was_pressed = false

func _ready():
	set_physics_process(true)
	add_child(joint)
	joint.set_global_position(hand_position.get_global_position())


func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		motion.x = -speed
	elif Input.is_action_pressed("move_right"):
		motion.x = speed
	else:
		motion.x = 0
	
	update_character_sprite()
	
	if is_on_wall():
		for index in get_slide_count():
			var collision = get_slide_collision(index)
			if collision.collider.is_in_group("MovableObject") and grabbing:
				print("GRABBING")
				if attached == false:
					attached = true
					joint.set_node_a(self.get_path())
					joint.set_node_b(collision.collider.get_path())
					print(joint.node_b)
	
	
				
	if Input.is_action_just_pressed("jump") and not attached:
		jump_was_pressed = true
		remember_jump()
		if can_cayote_jump:
			motion.y = jump_height
	
	if is_on_floor():
		can_cayote_jump = true
		if jump_was_pressed:
			motion.y = jump_height
	else:
		cayote_jump()
		if attached:
			motion.y = 0
		else:
			motion.y += gravity
		
	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)


func _unhandled_input(event):
	if event.is_action_pressed("grab"):
		grabbing = true
	elif event.is_action_released("grab"):
		grabbing = false
		attached = false
		joint.set_node_b(NodePath(""))
		print(joint.node_b)


func update_character_sprite():
	if grabbing:
		anim_player.play("Grab")
	else:
		if motion.x > 0:
			anim_player.play("Walk")
			sprite.flip_h = false
		elif motion.x < 0:
			anim_player.play("Walk")
			sprite.flip_h = true
		else:
			anim_player.play("Idle")


func remember_jump():
	yield(get_tree().create_timer(0.1), "timeout")
	jump_was_pressed = false


func cayote_jump():
	yield(get_tree().create_timer(0.1), "timeout")
	can_cayote_jump = false
