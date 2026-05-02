extends CharacterBody2D
@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@export var weapon_scene: PackedScene



func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y+= gravity
		if velocity.y > 1000:
			velocity.y=1000;
	
	var Horizontal_direction = Input.get_axis("move left","move right")
	velocity.x=speed * Horizontal_direction
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
		
			
	
	move_and_slide()
	print(velocity)
