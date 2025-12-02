class_name SceneTrigger
extends Area2D

@export var connected_scene: String # name of scene to change to
var scene_folder = "res://Scenes/"

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player: # optionnel mais recommandé
		var full_path = scene_folder + connected_scene + ".tscn"
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Level2.tscn")
