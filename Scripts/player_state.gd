extends State

class_name PlayerState

# Typed reference to the player
var _player: Player

func _ready() -> void:
	# Comme en C#, les states sont enfants du Player,
	# donc _ready() s'exécute avant celui du Player.
	
	_player = owner as Player

	if _player == null:
		push_error("PlayerState: 'owner' is not a Player! Check your scene setup.")
		return
	
	print("PlayerState: Ready")
