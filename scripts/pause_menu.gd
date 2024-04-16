extends Control

func _ready():
	$AnimationPlayer.play("RESET")
	$PanelContainer/VBoxContainer/ContinueButton.grab_focus()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("ui_cancel") and get_tree().paused == true:
		resume()

func _on_continue_button_pressed():
	resume()

func _on_quit_button_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()