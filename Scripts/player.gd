extends CharacterBody3D

const SENSITIVITY = 1.36
const SOURCE_ENGINE_SENS_MULTIPLIER =  0.00038397243458548043006658879114174

@onready var camera = $CameraController/Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * SENSITIVITY * SOURCE_ENGINE_SENS_MULTIPLIER)
		camera.rotate_x(-event.relative.y * SENSITIVITY * SOURCE_ENGINE_SENS_MULTIPLIER)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
