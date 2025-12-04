extends Node2D

@export var mute: bool = false

func _ready() -> void:
	pass
		
func play_music() -> void:
	if not mute:
		$Music.play()
		
func play_jump()->void:
	if not mute:
		$Jump.play()
		
func play_Attack()->void:
	if not mute:
		$Attack.play()
		
func stop_jump()->void:
	$Jump.stop()
		
func stop_Attack()->void:
	$Attack.stop()
	
func game_over_sound()-> void:
	if not mute:
		$Music.stop()
		$GameOver.play()
