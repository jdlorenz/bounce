extends State
class_name UnitChasePuck

@export var player: RigidBody2D
@export var move_speed:= 100.0

var move_direction : Vector2 
var wander_time : float

func move_towards_puck():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1,4)
	 
func rotate_towards_puck():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1,4)

func Enter():
	rotate_towards_puck()
	move_towards_puck()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	
	else:
		rotate_towards_puck()
		move_towards_puck()
		
func Physics_Update(delta: float):
	if player:
		player.linear_velocity = move_direction * move_speed
