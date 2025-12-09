extends Node

var win: bool = false
var fail: bool = false

var pause: bool = false

var first_time: bool = true

var max_health = 7
var health = max_health

var current_scene = null

func _ready():
	var root = get_tree().root
	# Using a negative index counts from the end, so this gets the last child node of `root`.
	current_scene = root.get_child(-1)
	
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	_deferred_goto_scene.call_deferred(path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

func toggle_pause()->void:
	if Input.is_action_just_pressed("pause"):
		if pause == true:
			get_tree().paused = true
		else:
			get_tree().paused = false
			
		pause = !pause
		
func toggle_collision()->void:
	if Input.is_action_just_pressed("Collision shapes"):
		get_tree().debug_collisions_hint = !get_tree().debug_collisions_hint
		
func final_scene()->void:
	if Input.is_action_just_pressed("final_scene"):
		SoundController.game_over_win()
		goto_scene("res://Scenes/final_scene.tscn")
	
	
			
func _process(delta: float) -> void:
	toggle_pause()
	toggle_collision()
	final_scene()
