extends Control

@onready var main_buttons : VBoxContainer =  $MainButtons

@onready var options : Panel = $Options


func _ready() -> void:
	main_buttons.visible = true
	options.visible = false	

func _on_start_pressed() -> void:
	print("start pressed")
	

func _on_settings_pressed() -> void:
	print("options pressed")
	main_buttons.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_cancel_pressed() -> void:
	_ready()
	
func pause():
	get_tree().paused = true
	
func resume():
	get_tree().paused = false
	
func test_enter():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()

func _on_restart_pressed() -> void:
	resume()
	
	
func _process(delta):
	test_enter()
