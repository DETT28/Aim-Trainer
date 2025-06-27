class_name Target_Block
extends CharacterBody3D

signal target_kill

var health = 150

func _ready():
	pass

func _process(delta):
	if health <= 0:
		queue_free()
		emit_signal("target_kill")
