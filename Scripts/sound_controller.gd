extends Node2D

@export var mute: bool = false
var volume: float


func _ready() -> void:
	if not mute:
		play_music()
		
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
	
func game_over_fail()-> void:
	if not mute:
		$Music.stop()
		$GameOverFail.play()
		
func game_over_win()-> void:
	if not mute:
		$Music.stop()
		$GameOverWin.play()
		
func set_volume(value: float):
	$Music.volume_db = value
