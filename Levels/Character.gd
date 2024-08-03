extends Node3D

# Variables for camera position and rotation
var camera_position: Vector3
var camera_rotation: Vector3

# Reference to the Camera node
@onready var camera = $Camera

# Called when the node enters the scene tree for the first time
func _ready():
	camera_rotation = rotation_degrees # Initial rotation
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	# Set position and rotation to targets
	position = camera_position / 10
	rotation_degrees = rotation_degrees.lerp(camera_rotation, delta * 20)
	handle_input(delta)

# Handle input
func handle_input(_delta):
	# Rotation
	var input := Vector3.ZERO
	input.x = Input.get_axis("left", "right")
	input.z = Input.get_axis("up", "down")
	input = input.rotated(Vector3.UP, rotation.y).normalized()
	camera_position += input / 7
	
	# Reset camera position
	if Input.is_action_pressed("camera_center"):
		camera_position = Vector3()

# Handle mouse input for camera rotation
func _input(event):
	# Rotate camera using mouse (hold 'middle' mouse button)
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("camera_rotate"):
			camera_rotation += Vector3(0, -event.relative.x / 2.5, 0)
