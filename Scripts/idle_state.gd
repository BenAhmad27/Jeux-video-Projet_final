extends PlayerState

func enter(message: Dictionary = {}) -> void:
	# On ralentit progressivement vers zéro
	_player.motion = _player.motion.lerp(Vector2.ZERO, 0.2)

	if _player.anim_player:
		_player.anim_player.play("Idle")

	print("Entering : %s" % self.get_class())


func physics_update(delta: float) -> void:
	_player.motion = _player.motion.lerp(Vector2.ZERO, 0.2)
	_player.velocity = _player.motion

	# Tombe si le joueur n'est plus sur le sol
	if not _player.is_on_floor():
		_state_machine.transition_to("Fall")
		return

	# Saut
	if Input.is_action_just_pressed("ui_jump"):
		_state_machine.transition_to("Jump")
		return

	# Mouvement gauche/droite → courir
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		_state_machine.transition_to("Run")
		return

	# Attaque
	if Input.is_action_just_pressed("attack"):
		_state_machine.transition_to("Attack")
