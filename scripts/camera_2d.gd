extends Camera2D

@export var speed: float = 1000.0
@onready var camera_2d: Camera2D = $"."

var zomm = 0.1

func _process(delta):
	var direction = Vector2.ZERO
	camera_2d.zoom = Vector2(zomm,zomm)

	if Input.is_action_pressed("camera_up"):
		direction.y -= 1
	if Input.is_action_pressed("camera_down"):
		direction.y += 1
	if Input.is_action_pressed("camera_left"):
		direction.x -= 1
	if Input.is_action_pressed("camera_right"):
		direction.x += 1
	if Input.is_action_pressed("zoom_out"):
		zomm += 0.01
		if zomm >= 1:
			zomm = 1
		
	if Input.is_action_pressed("zoom_in"):
		zomm -= 0.01
		if zomm <= 0.01:
			zomm = 0.01

	# Normalize the direction vector to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()

	global_position += (direction * speed * delta) / zomm
