extends CharacterBody3D


@onready var spring_arm: SpringArm3D = $SpringArm3D

func _ready():
	# Evita que el springarm haga colisiones
	spring_arm.add_excluded_object(self)
	
