extends Node2D

@onready var world = get_tree().get_root().get_node("World")
@onready var projectile = load("res://Scenes/projectile.tscn")

@export var fire_rate := 0.1

var can_shoot := true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position 
	instance.spawnRot = rotation 
	world.add_child.call_deferred(instance)
	
func cooldown():
	can_shoot = false
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
	
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("fire"):
		shoot()
		cooldown()
		


	
