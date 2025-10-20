extends Node3D

@export var player : CharacterBody3D
@onready var animation_tree = $AnimationTree

var currentspeed = Vector2.ZERO
var strafe_acceleration = 4
var targetspeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player == null:
		return

	targetspeed = Vector2(player.input_dir.x, player.input_dir.y).normalized()
	animation_tree.set("parameters/BlendSpace1D/blend_position", targetspeed)
