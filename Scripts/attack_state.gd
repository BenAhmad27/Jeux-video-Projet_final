extends PlayerState

var _animation_finished := false

func enter(message: Dictionary = {}):
	_animation_finished = false

	# Lecture de l'animation Attack
	_player.anim_player.play("Attack")

	# Connexion du signal d'animation terminée
	_player.anim_player.animation_finished.connect(_on_animation_finished)

	print("Entering : %s" % self.get_class())

	# Arrêter les mouvements horizontaux pendant l’attaque
	_player.motion.x = 0
	_player.velocity = _player.motion


func physics_update(delta: float) -> void:
	# Le joueur continue de tomber si dans les airs
	_player.motion.y += _player.GRAVITY * delta
	_player.velocity = _player.motion
	_player.move_and_slide()

	# Dès que l’animation est finie → retour Idle ou Fall
	if _animation_finished:
		if not _player.is_on_floor():
			_state_machine.transition_to("Fall")
			return

		_state_machine.transition_to("Idle")


func exit() -> void:
	# On déconnecte le signal pour éviter les doublons
	if _player.anim_player.animation_finished.is_connected(_on_animation_finished):
		_player.anim_player.animation_finished.disconnect(_on_animation_finished)


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Attack":
		_animation_finished = true
