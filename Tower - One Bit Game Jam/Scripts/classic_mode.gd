extends Node2D


var EasyNumberList = [0,1]
var MediumNumberList = []
var HardNumberList = []

######## Levels : A
var Level_a_1 = preload("res://Levels/level_a_1.tscn")
var Level_a_2 = preload("res://Levels/level_a_2.tscn")

var RoomNumber = 0
var instance 

func _ready():
	RandomNumber(EasyNumberList)

func _process(delta):
	$Camera2D.position.x = 576

################################### WIN ########################

	if Global.Win == true:
		Global.Win = false
		$BlackTansition.visible = true
		instance.queue_free()
		$EndRoom.play()
		for i in 25:
			$BlackTansition.position.y += 10
			await $".".get_tree().create_timer(.02).timeout
		if RoomNumber <= 5:
			RandomNumber(EasyNumberList)
		elif RoomNumber >= 6 and RoomNumber <= 10:
			RandomNumber(MediumNumberList)
		else:
			RandomNumber(HardNumberList)
		$BlackTansition.visible = false
		$BlackTansition.position.y += 500
		
################################################################################


func RandomNumber(NumberList):
	RoomNumber += 1
	var RandomNumber = NumberList.pick_random()
	NumberList.remove_at(RandomNumber)
	InstantiateRoom(RandomNumber)

func InstantiateRoom(Random):
	Random += 1
	if Random == 1:
		instance = Level_a_1.instantiate()
		instance.position = get_viewport_rect().size / 2
		add_child(instance)
		$Player.position = Vector2(78,352)
	if Random == 2:
		instance = Level_a_2.instantiate()
		instance.position = get_viewport_rect().size / 2
		add_child(instance)
		
		
