extends CharacterBody2D
class_name Ennemy

var is_moving_left = true
var gravity = 10
var speed = 32

var max_health = 3
var health = max_health



func _ready():
	$AnimationPlayer.play("Walk")
	$HealthBar.value = health 

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
	#Raycast
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func hit():
	$AttackDetector.monitoring = true

func end_of_hit():
	$AttackDetector.monitoring = false

func start_walk():
	$AnimationPlayer.play("Walk")


func _on_player_detector_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("Attack")


func _on_attack_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(1)  # Le joueur inflige 1 point de dégâts
		print("Player HIT")
		#get_tree().call_deferred("reload_current_scene")
			
func take_damage(amount: int):
	health -= amount
	health = max(health, 0)

	$HealthBar.value = health  # mise à jour de la barre de vie (si tu as une ProgressBar)

	if health == 0:
		die()
		#get_tree().call_deferred("reload_current_scene")
		
func die():
	# On peut jouer une animation de mort si tu veux
	$AnimationPlayer.play("Dead")
	# Supprimer l’ennemi après l’animation
	call_deferred("queue_free")
	
