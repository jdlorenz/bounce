extends State
class_name UnitIdle

@export var player: RigidBody2D
@export var move_speed:= 100.0

var puck: RigidBody2D

var move_direction : Vector2 
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1,4)
	 
func Enter():
	puck = get_tree().get_first_node_in_group("Puck")
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if player:
		player.linear_velocity = move_direction * move_speed
	
	var direction = puck.global_position - player.global_position
	
	if direction.length() < 500:
		Transitioned.emit(self, "UnitChasePuck")
