using Godot;
using System;

public partial class BaseState : Node
{
    [Signal]
    public delegate void TransitionedEventHandler();

    public virtual void HandleInputs(InputEvent inputEvent)
    {
    }

    public virtual void Update(double delta)
    {
    }

    public virtual void PhysicsUpdate(double delta)
    {
    }

    public virtual void Enter()
    {
    }

    public virtual void Exit()
    {
    }
}
