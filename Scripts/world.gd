extends Node2D

@onready var level1: Node2D = $Level1

@onready var level2: Node2D = $Level2


func _ready() -> void:
	on_level1()
		
func on_level1():
	level1.visible = true
	level1.set_process(true)
	level1.set_physics_process(true)
	
func on_level2():
	level2.visible = true
	level2.set_process(true)
	level2.set_physics_process(true)

	
	
func off_level1():
	level1.visible = false
	level1.set_process(false)
	level1.set_physics_process(false)
	
func _process(delta):
	if Global.firstlevel == false:
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
	
