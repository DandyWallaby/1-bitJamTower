extends Node



var window_state = true

func _process(delta):
	if Input.is_action_just_pressed("f11"):
		window_state = !window_state
		if window_state == true: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if Input.is_action_just_pressed("ui_cancel"): get_tree().quit() ###Remove Line 10 Before Release

	
var Direction = "right"

var Win = false
