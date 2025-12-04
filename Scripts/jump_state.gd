extends PlayerState

func enter(message: Dictionary = {}) -> void:
	_player.motion.y = -_player.JUMPFORCE
	_player.anim_player.play("Jump")
	SoundController.play_jump()

	print("Entering : %s" % self.get_class())


func physics_update(delta: float) -> void:
	# Mouvement horizontal
	var input_dir_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	_player.motion.x += _player.ACCEL * input_dir_x
	_player.motion.y += _player.GRAVITY * delta

	_player.motion.x = clamp(_player.motion.x, -_player.MAXSPEED, _player.MAXSPEED)
	_player.velocity = _player.motion

	_player.move_and_slide()

	# Orientation
	if input_dir_x > 0:
		_player.facing_right = true
	elif input_dir_x < 0:
		_player.facing_right = false

	# Quand le joueur commence à retomber
	if _player.motion.y > 0:
		_state_machine.transition_to("Fall")
		SoundController.stop_jump()
