extends Node3D

var target_block = preload("res://Scenes/target_block.tscn")

var spawn_range_x = Vector2(-3.5, 3.5)
var spawn_range_y = Vector2(0.5, 3.5)
# var spawn_range_z = Vector2(-10, 10)

func _ready():
	spawn_target(Vector3(0,1,0))
	
func spawn_target_random():
	var random_pos = Vector3(
		randf_range(spawn_range_x.x, spawn_range_x.y),
		randf_range(spawn_range_y.x, spawn_range_y.y),
		-3
	)
	spawn_target(random_pos)

func spawn_target(pos):
	var target = target_block.instantiate()
	target.position = pos
	add_child(target)
	target.connect("target_kill", _on_target_killed)

func _on_target_killed():
	spawn_target_random()
