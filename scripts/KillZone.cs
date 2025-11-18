using Godot;
using System;

public partial class KillZone : Area2D
{
	private Timer _timer;

	public override void _Ready()
	{
		_timer = GetNode<Timer>("Timer");

		// Connecter les signaux (si ce n’est pas déjà fait dans l’éditeur)
		BodyEntered += OnBodyEntered;
		_timer.Timeout += OnTimerTimeout;
	}

	private void OnBodyEntered(Node2D body)
	{
		GD.Print("You died!");
		_timer.Start();
	}

	private void OnTimerTimeout()
	{
		GetTree().ReloadCurrentScene();
	}
}
