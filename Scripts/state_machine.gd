extends Node
class_name StateMachine

## Émis lorsque l'état a changé
signal transitioned(state_name: String)

## Chemin vers l'état initial (configurable dans l'inspecteur)
@export var initial_state: NodePath

## L'état courant
var state: State


func _ready() -> void:
	state = get_node(initial_state)

	print("StateMachine: Waiting for owner to be ready.")

	# Assigner cette state machine à tous les enfants (les states)
	for child in get_children():
		if child is State:
			child._state_machine = self

	state.enter()

	print("StateMachine: Ready")


func _unhandled_input(event: InputEvent) -> void:
	state.handle_inputs(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)


## Transition vers un autre état
func transition_to(target_state_name: String, message: Dictionary = {}) -> void:
	print("Transitioning to %s" % target_state_name)

	# Vérification que l'état existe
	if not has_node(target_state_name):
		return

	state.exit()

	state = get_node(target_state_name)
	state.enter(message)

	emit_signal("transitioned", state.name)
