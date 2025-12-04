extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player id DIED") # Replace with function body.
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
