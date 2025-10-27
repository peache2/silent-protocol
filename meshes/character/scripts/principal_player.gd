extends CharacterBody3D


const SPEED = 1.0
const JUMP_VELOCITY = 4.5

var bob_time := 0.0
var idle_bob_speed := 1.0
var idle_bob_amount := 0.01
@onready var camera = $Camera3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Walk_Right", "Walk_Left", "Walk_Backward", "Walk_Forward")
	
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()	
	
	
func _process(delta: float) -> void:
	camera_bob(delta)

func camera_bob(delta: float) -> void:
	if is_on_floor() and velocity.length() > 0:
		bob_time += delta * (5 if Input.is_action_pressed("sprint") else 8)
		
		
		camera.position.y = 0.55 + sin(bob_time) * (0.08 if Input.is_action_pressed("sprint") else 0.06)
	else:
		bob_time += delta * idle_bob_speed
		camera.position.y = 0.55 + sin(bob_time) * idle_bob_amount
	
