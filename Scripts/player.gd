extends CharacterBody2D
@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@export var weapon_scene: PackedScene
@export var running_speed = 150

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y+= gravity
		if velocity.y > 1000:
			velocity.y=1000;
	
	var Horizontal_direction = Input.get_axis("move left","move right")
	var curr_speed = speed
	if Input.is_action_pressed("run"):
		curr_speed = speed + running_speed
	velocity.x= curr_speed * Horizontal_direction

	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force

	move_and_slide()
	
	if !is_on_floor():
		anim.play("jump")
		anim.flip_h = Horizontal_direction < 0
	elif Horizontal_direction != 0:
		if Input.is_action_pressed("run"):
			anim.play("walk")
		else:
			anim.play("walk")
		anim.flip_h = Horizontal_direction < 0
	else:
		anim.stop()

	print(velocity)
