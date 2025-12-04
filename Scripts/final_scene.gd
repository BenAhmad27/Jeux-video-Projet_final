extends Control

@onready var main_buttons : VBoxContainer =  $MainButtons

func _ready() -> void:
	main_buttons.visible = true


func _on_start_pressed() -> void:
	Global.goto_scene("res://Scenes/Level1.tscn")
	SoundController.play_music()
	

func _on_exit_pressed() -> void:
	get_tree().quit()


	
