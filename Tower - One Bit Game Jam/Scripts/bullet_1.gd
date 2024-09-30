extends CharacterBody2D


var speed = -800

func _process(delta):
	velocity.x = speed
	
	move_and_slide()
	
	if position.x < -512:
		queue_free()
