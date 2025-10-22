extends Camera3D

var sensitivity = 0.2
var rotation_x = 0.0  # Acumula la rotación vertical (pitch)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Rotar el padre (yaw)
		get_parent().rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		
		# Actualizar rotación vertical acumulada (pitch)
		rotation_x += deg_to_rad(event.relative.y * sensitivity)
		
		# Limitar la rotación vertical para evitar giros raros
		rotation_x = clamp(rotation_x, deg_to_rad(-80), deg_to_rad(40))
		
		# Aplicar la rotación vertical absoluta a la cámara
		rotation.x = rotation_x
