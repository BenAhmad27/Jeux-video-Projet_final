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


var attack_detector 

var player_in_attack_zone = false
var player_ref = null

var enemy_ref = null

var attack_cooldown = 0.5
var attack_timer = 0.0

# ===============================================================

func _ready() -> void:
	current_sprite = $Sprite2D
	anim_player = $AnimationPlayer
	state_machine = $StateMachine
	attack_detector = $AttackDetector
	$HealthBarPlayer.value = Global.health 



func _physics_process(delta: float) -> void:
	# Flip horizontal du sprite selon la direction
	current_sprite.flip_h = not facing_right
	
	
func _process(delta):
	if player_in_attack_zone:
		attack_timer -= delta
		# Vérifie si le joueur est en train d'attaquer
	if anim_player.current_animation == "Attack" and attack_timer <= 0:
		if enemy_ref and enemy_ref.has_method("take_damage"):
			enemy_ref.take_damage(1)  # Le joueur inflige 1 point de dégâts
			attack_timer = attack_cooldown


func _on_attack_detector_body_entered(body: Node2D) -> void:
	if body is Ennemy:  # ou un test body.name == "Enemy"
		player_in_attack_zone = true
		enemy_ref = body


func _on_attack_detector_body_exited(body: Node2D) -> void:
	if body == enemy_ref:
		player_in_attack_zone = false
		enemy_ref = null
		
func take_damage(amount: int):
	Global.health -= amount
	Global.health = max(Global.health, 0)

	$HealthBarPlayer.value = Global.health  # mise à jour de la barre de vie (si tu as une ProgressBar)

	if Global.health == 0:
		die()
		
		
func die():
	# On peut jouer une animation de mort si tu veux
	$StateMachine.set_process(false)
	set_physics_process(false)
	$AnimationPlayer.play("Dead")
	# Supprimer l’ennemi après l’animation
	await get_tree().create_timer(2.0).timeout
	get_tree().call_deferred("reload_current_scene")
		
