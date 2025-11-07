using Godot;
using System;

public partial class GenericCharacter : CharacterBody2D
{
    protected AnimationPlayer AnimPlayer;
    protected Sprite2D Sprite;
    protected Vector2 Direction;

    public override void _Ready()
    {
        AnimPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
        Sprite = GetNode<Sprite2D>("Sprite2D");
    }

    public AnimationPlayer GetAnimationPlayer() => AnimPlayer;
}
