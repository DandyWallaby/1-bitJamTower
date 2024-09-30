extends CharacterBody2D

var speed = -800

func _process(delta):
	velocity.y = speed
	
	move_and_slide()
	
	if position.y < -5504:
		queue_free()
