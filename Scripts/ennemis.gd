#extends CharacterBody2D
#class_name Ennemis
#
#
#
## === CONSTANTES / VARIABLES ===
#var GRAVITY: int = 400
#var MAXFALLSPEED: int = 200
#var MAXSPEED: int = 150
#var JUMPFORCE: int = 300
#
#var ACCEL: int = 10
#var vZero: Vector2 = Vector2.ZERO
#
#var facing_right: bool = true
#var dir: float = 0.0
#var motion: Vector2 = Vector2.ZERO
#
#var current_sprite: Sprite2D
#var anim_player: AnimationPlayer
#var state_machine: Node
#
## ===============================================================
#func _ready() -> void:
	#current_sprite = $Sprite2D
	#anim_player = $AnimationPlayer
	#state_machine = $StateMachine
	#anim_player.play("Idle")
	#
#
#func _physics_process(delta: float) -> void:
	## Flip horizontal du sprite selon la direction
	#current_sprite.flip_h = not facing_right
	
	
	
	
extends CharacterBody2D

var is_moving_left = false
var gravity = 10
var speed = 32

func _ready():
	$AnimationPlayer.play("Walk")

func _process(_delta):
	if $AnimationPlayer.current_animation == "Attack":
		return

	move_character()
	detect_turn_around()

func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity

	move_and_slide()

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false

func start_walk():
	$AnimationPlayer.play("Walk")

func _on_PlayerDetector_body_entered(body):
	$AnimationPlayer.play("Attack")

func _on_AttackDetector_body_entered(body):
	get_tree().reload_current_scene()
