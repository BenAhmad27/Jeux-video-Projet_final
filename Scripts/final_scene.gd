extends Control

@onready var main_buttons : VBoxContainer =  $MainButtons
@onready var fail : Label = $Fail
@onready var win : Label = $Win

func _ready() -> void:
	main_buttons.visible = true
	Global.health = Global.max_health
	if Global.win == true:
		SoundController.game_over_win()
		win.visible = true
		fail.visible = false
		
	if Global.fail == true:
		SoundController.game_over_fail()
		fail.visible = true
		win.visible = false


func _on_start_pressed() -> void:
	Global.goto_scene("res://Scenes/Level1.tscn")
	SoundController.play_music()
	

func _on_exit_pressed() -> void:
	get_tree().quit()


	
