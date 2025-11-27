extends CharacterBody2D
class_name Player

# === CONSTANTES / VARIABLES ===
var GRAVITY: int = 400
var MAXFALLSPEED: int = 200
var MAXSPEED: int = 150
var JUMPFORCE: int = 300

var ACCEL: int = 10
var vZero: Vector2 = Vector2.ZERO

var facing_right: bool = true
var dir: float = 0.0
var motion: Vector2 = Vector2.ZERO

var current_sprite: Sprite2D
var anim_player: AnimationPlayer
var state_machine: Node

var health := 100
var attack_power := 20
var attack_detector 

# ===============================================================

func _ready() -> void:
	current_sprite = $Sprite2D
	anim_player = $AnimationPlayer
	state_machine = $StateMachine
	attack_detector = $AttackDetector


func _physics_process(delta: float) -> void:
	# Flip horizontal du sprite selon la direction
	current_sprite.flip_h = not facing_right
	
	
