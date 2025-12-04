extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player id DIED") # Replace with function body.
		timer.start()


func _on_timer_timeout() -> void:
	Global.fail = true
	Global.win = false
	Global.goto_scene("res://Scenes/final_scene.tscn")
