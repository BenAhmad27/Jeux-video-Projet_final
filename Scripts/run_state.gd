extends PlayerState

func enter(message: Dictionary = {}) -> void:
	print("Entering : %s" % self.get_class())
	_player.anim_player.play("Run")


func physics_update(delta: float) -> void:
	# Transition vers Fall si le joueur n'est pas sur le sol
	if not _player.is_on_floor():
		_state_machine.transition_to("Fall")
		return

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

	# Saut
	if Input.is_action_just_pressed("ui_jump"):
		var message := {"doJump": true}
		_state_machine.transition_to("Jump", message)
		return

	# Transition vers Idle si pas de mouvement horizontal
	if is_equal_approx(input_dir_x, 0.0):
		_state_machine.transition_to("Idle")
