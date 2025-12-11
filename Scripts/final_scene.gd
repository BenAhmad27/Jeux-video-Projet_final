extends Control
@onready var win_message : String = "Congratulations, you found the remedy!"
@onready var fail_message : String = "Oh nooon you fail. try again!"
@onready var main_buttons : VBoxContainer =  $VBoxContainer2/MainButtons
@onready var end_message : Label = $VBoxContainer2/VBoxContainer/EndLabel


func _ready() -> void:
	$VBoxContainer2/MainButtons/Restart.grab_focus()
	Global.health = Global.max_health
	if Global.win == true:
		SoundController.game_over_win()
		end_message.text = win_message
		
	if Global.fail == true:
		SoundController.game_over_fail()
		end_message.text = fail_message

func _on_restart_pressed() -> void:
	Global.goto_scene("res://Scenes/Level1.tscn")
	SoundController.play_music()


func _on_menu_principal_pressed() -> void:
	Global.goto_scene("res://Scenes/MainMenu.tscn")
	Global.first_time = false


func _on_exit_pressed() -> void:
	get_tree().quit()
