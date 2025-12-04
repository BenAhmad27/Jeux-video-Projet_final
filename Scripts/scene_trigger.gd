class_name SceneTrigger
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player: # optionnel mais recommandé
		Global.goto_scene("res://Scenes/Level2.tscn")
