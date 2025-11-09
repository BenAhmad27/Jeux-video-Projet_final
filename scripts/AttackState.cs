using Godot;
using System;
using System.Collections.Generic;

public partial class AttackState : PlayerState
{
	private bool _animationFinished = false;

	public override void Enter(Dictionary<string, bool> message = null)
	{
		_animationFinished = false;

		// Lecture de l'animation Attack
		_player.animPlayer.Play("Attack");

		// Événement pour savoir quand l'animation est finie
		_player.animPlayer.AnimationFinished += OnAnimationFinished;

		GD.Print("Entering : " + GetType().Name);

		// Arrêter les mouvements horizontaux pendant l’attaque
		_player.Motion.X = 0;
		_player.Velocity = _player.Motion;
	}

	public override void PhysicsUpdate(float delta)
	{
		// Pendant l’attaque, le joueur tombe quand même si dans les airs
		_player.Motion.Y += _player.GRAVITY * delta;
		_player.Velocity = _player.Motion;
		_player.MoveAndSlide();

		// Dès que l’animation est finie → retour Idle
		if (_animationFinished)
		{
			// Si on est dans les airs → Fall
			if (!_player.IsOnFloor())
			{
				_stateMachine.TransitionTo("Fall");
				return;
			}

			_stateMachine.TransitionTo("Idle");
		}
	}

	public override void Exit()
	{
		// Important : détacher l’événement sinon il va se déclencher plusieurs fois
		_player.animPlayer.AnimationFinished -= OnAnimationFinished;
	}

	private void OnAnimationFinished(StringName animName)
	{
		if (animName == "Attack")
		{
			_animationFinished = true;
		}
	}
}
