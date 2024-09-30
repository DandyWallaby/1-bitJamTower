extends CharacterBody2D


var SPEED = 250.0
const JUMP_VELOCITY = -535.0
var shootDelay = 0.6


var Bullet = preload("res://Scenes/player_bullet.tscn")
@onready var anim = $Sprite
var gravity = 980
var canFire = true

var animationHelper = false
var SecondAnimationHelper = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		if SecondAnimationHelper == true:
			SecondAnimationHelper = false
			anim.play("land")
		else:
			if velocity.x < 0:
				anim.play("walk")
				$Sprite.flip_h = true
			elif velocity.x > 0: 
				anim.play("walk")
				$Sprite.flip_h = false
			else:
				anim.play("idle")

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		
		anim.play("prejump")
		animationHelper = true
		SecondAnimationHelper = true
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("Fire"):
		if canFire == true:
			waitFire()
			var instance = Bullet.instantiate()
			instance.position = $".".position
			add_sibling(instance)
		

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			Global.Direction = "right"
			$Sprite.flip_h = false
		if velocity.x < 0:
			Global.Direction = "left"
			$Sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	$"../Camera2D".position.y = $".".position.y - 10
		
		
	move_and_slide()

func waitFire():
	canFire = false
	await $".".get_tree().create_timer(shootDelay).timeout
	canFire = true
		
	
func _on_sprite_animation_finished():
	if animationHelper == true:
		animationHelper = false
		anim.play("jump")

func _on_collision_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("Bullet"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	if area.is_in_group("End"):
		$Sprite.visible = false
		Global.Win = true
		await $".".get_tree().create_timer(.5).timeout
		$Sprite.visible = true
