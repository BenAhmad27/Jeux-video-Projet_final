extends Node
class_name State

# Référence vers la machine à états (assignée automatiquement depuis StateMachine.gd)
var _state_machine: StateMachine = null


## Correspond à _unhandled_input()
func handle_inputs(event: InputEvent) -> void:
	pass


## Correspond à _process()
func update(delta: float) -> void:
	pass


## Correspond à _physics_process()
func physics_update(delta: float) -> void:
	pass


## Appelé lors du changement d'état
func enter(message: Dictionary = {}) -> void:
	pass


## Appelé lorsque l'état se termine
func exit() -> void:
	pass
