class_name SceneTrigger
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player: # optionnel mais recommandé
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Level2.tscn")
		
