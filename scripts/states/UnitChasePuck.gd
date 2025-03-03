extends State
class_name UnitChasePuck

@export var player: RigidBody2D
@export var move_speed:= 200.0

var puck: RigidBody2D

func Enter():
	puck = get_tree().get_first_node_in_group("Puck")
		
func Physics_Update(delta: float):
	var direction = puck.global_position - player.global_position
	var angle = direction.angle() + deg_to_rad(90)
	var r = player.global_rotation
	player.mass = 100

	player.global_rotation = lerp_angle(r,angle,0.02)
	
	if direction.length() < 500:
		player.move_and_collide(direction.normalized() * move_speed * delta)
		player.global_rotation = lerp_angle(r,angle,0.02)
	else:
		player.move_and_collide(direction.normalized() * move_speed * delta)
		
	if direction.length() >= 500:
		Transitioned.emit(self, "UnitIdle")
	
	

	
