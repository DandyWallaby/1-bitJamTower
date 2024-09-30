extends CharacterBody2D

var speed = 800
@export var dir = "left"

func _ready():
	if Global.Direction == "right":
		dir = "right"
	else: 
		dir = "left"
		$Icon.flip_h = true

func _physics_process(delta):
	if dir == "right":
		velocity.x = speed
	else:
		velocity.x = -speed
	move_and_slide()
