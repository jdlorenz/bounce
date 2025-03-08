extends RigidBody2D

@export var ball_speed = 150.0
@export var ball_angle = randf_range(0, 360)
var ball_vector = Vector2(ball_speed * cos(deg_to_rad(ball_angle)),ball_speed * sin(deg_to_rad(ball_angle)))
var last_collision_id = 0

func _friction(delta):
	if ball_speed > 150.0:
		ball_speed = ball_speed *.99
	if ball_speed < 150.0:
		ball_speed = 150.0

func _physics_process(delta):
	_friction(delta)
	mass = 100
	var collision_info = move_and_collide(ball_vector * delta)
	if collision_info:
		var collider = collision_info.get_collider()
		print(collider.get_instance_id())
		if last_collision_id == collider.get_instance_id() and collider.get_class() == "RigidBody2D":
			pass
		elif collision_info.get_collider().get_class() == "RigidBody2D":
			ball_speed = ball_speed * 2
			ball_vector = 2* ball_vector.bounce(collision_info.get_normal())
		else:
			ball_vector = ball_vector.bounce(collision_info.get_normal())
		last_collision_id = collision_info.get_collider_id()
	rotate(5 * delta)
