extends CharacterBody3D

var health = 150

func _ready():
	pass

func _process(delta):
	if health <= 0:
		queue_free()
