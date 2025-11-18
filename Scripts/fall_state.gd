extends PlayerState

func enter(message: Dictionary = {}) -> void:
	_player.anim_player.play("Fall")

	print("Entering : %s" % self.get_class())


func physics_update(delta: float) -> void:
	# Mouvement horizontal basé sur les inputs
	var input_direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	_player.motion.x += _player.ACCEL * input_direction_x
	_player.motion.y += _player.GRAVITY * delta

	_player.motion.x = clamp(_player.motion.x, -_player.MAXSPEED, _player.MAXSPEED)

	_player.velocity = _player.motion
	_player.move_and_slide()

	# Orientation
	if input_direction_x > 0:
		_player.facing_right = true
	elif input_direction_x < 0:
		_player.facing_right = false

	# Atterrissage
	if _player.is_on_floor():
		_state_machine.transition_to("Idle")
