extends Node3D

const SENSITIVITY = 2.0
const SOURCE_ENGINE_SENS_MULTIPLIER =  0.00038397243458548043006658879114174

var damage = 150
var shotsTaken = 0
var shotsHit = 0

@onready var camera = $CameraController/Camera3D
@onready var aimcast = $CameraController/Camera3D/AimCast

func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		shotsTaken += 1
		if aimcast.is_colliding():
			var target = aimcast.get_collider()
			if target.is_in_group("Enemy"): 
				print("hit target")
				target.health -= damage
				shotsHit += 1
				print(shotsHit)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * SENSITIVITY * SOURCE_ENGINE_SENS_MULTIPLIER)
		camera.rotate_x(-event.relative.y * SENSITIVITY * SOURCE_ENGINE_SENS_MULTIPLIER)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
