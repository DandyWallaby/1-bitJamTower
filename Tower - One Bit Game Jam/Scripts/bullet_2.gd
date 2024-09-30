extends CharacterBody2D


var speed = -800

func _process(delta):
	velocity = Vector2(speed/2,speed/2)
	
	move_and_slide()
	
	if position.y < -512:
		queue_free()
