extends Marker2D
@export var weapon_scene: PackedScene
@onready var socket = $WeaponSocket

var weapon
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	weapon = weapon_scene.instantiate()
	socket.add_child(weapon)
	weapon.position = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
