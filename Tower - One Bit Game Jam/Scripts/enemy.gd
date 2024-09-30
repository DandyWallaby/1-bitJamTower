extends CharacterBody2D

var b_1 = preload("res://Scenes/EnemyBullets/bullet_1.tscn")
var b_2 = preload("res://Scenes/EnemyBullets/bullet_2.tscn")
var b_3 = preload("res://Scenes/EnemyBullets/bullet_3.tscn")
var b_4 = preload("res://Scenes/EnemyBullets/bullet_4.tscn")
var b_5 = preload("res://Scenes/EnemyBullets/bullet_5.tscn")
var b_6 = preload("res://Scenes/EnemyBullets/bullet_6.tscn")
var b_7 = preload("res://Scenes/EnemyBullets/bullet_7.tscn")
var b_8 = preload("res://Scenes/EnemyBullets/bullet_8.tscn")

@export var shootDelay: float

@export var _1: bool = false
@export var _2: bool = false
@export var _3: bool = false
@export var _4: bool = false
@export var _5: bool = false
@export var _6: bool = false
@export var _7: bool = false
@export var _8: bool = false

func _ready():
	run()
	
func run():
	shoot()
	await $".".get_tree().create_timer(shootDelay).timeout
	run()
	
func shoot():
	if _1:
		var instance = b_1.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _2:
		var instance = b_2.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _3:
		var instance = b_3.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _4:
		var instance = b_4.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _5:
		var instance = b_5.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _6:
		var instance = b_6.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _7:
		var instance = b_7.instantiate()
		instance.position = $".".position
		add_sibling(instance)
	if _8:
		var instance = b_8.instantiate()
		instance.position = $".".position
		add_sibling(instance)

