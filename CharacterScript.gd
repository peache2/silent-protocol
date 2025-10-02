extends CharacterBody3D

enum {IDLE,WALK}
var curAnim = IDLE 

func _physics_process(delta):
	handle_animations(delta)
	
	curAnim = WALK 



@onready var animation_tree: AnimationTree = $AnimationTree

@export var blend_speed = 15

var walk_val = 0

func handle_animations(delta):
	match curAnim:
		IDLE:
			walk_val = lerpf(walk_val,0,blend_speed*delta)
			
		WALK:
			walk_val = lerpf(walk_val,1,blend_speed*delta)
			
 
func update_tree():
	animation_tree["parameters/Walk/blend_amount"] = walk_val
