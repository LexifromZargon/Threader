extends CharacterBody2D
@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@export var weapon_scene: PackedScene
@export var running_speed = 150
@export var health_points = 3

@onready var anim = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var camera = $Camera2D

@onready var game_over_label = $CanvasLayer/GameOverLabel
var is_game_over = false

func game_over():
	is_game_over = true
	velocity = Vector2.ZERO
	game_over_label.visible = true

func respawn():

	if health_points > 0:
		health_points -= 1
		if health_points == 0:
			game_over()
		else:
			self.global_position = Vector2(603, 375)
	else:
		velocity = Vector2.ZERO

func restart():
	self.global_position = Vector2(603, 375)
	health_points = 3		

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
		
	if Input.is_action_just_pressed("restart"):
		restart()

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
