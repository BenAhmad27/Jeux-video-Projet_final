extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player: # optionnel mais recommandé
		SoundController.game_over_sound()
		Global.goto_scene("res://Scenes/final_scene.tscn")
		
