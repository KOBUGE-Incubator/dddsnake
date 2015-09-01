extends RigidBody

# controls
var delay_start = .42
var speed = 500
var force = Vector3(0,0,-1)
# Set at the beginning in order to make the snake automatically start moving forward
var array = []
var right
var left
var up
var down

func _input(event):
	if(Input.is_action_pressed("ui_right")):
		rotate_y(PI/2)
		force = force.rotated(Vector3(0,1,0), PI/2)
		right = false
	if(Input.is_action_pressed("ui_left")):
		rotate_y(-PI/2)
		force = force.rotated(Vector3(0,1,0), -PI/2)
	if(Input.is_action_pressed("ui_down")):
		rotate_x(PI/2)
		force = force.rotated(Vector3(1,0,0), PI/2)
	if(Input.is_action_pressed("ui_up")):
		rotate_x(-PI/2)
		force = force.rotated(Vector3(1,0,0), -PI/2)

func _integrate_forces(state):
	array.push_back(get_global_transform())
	if delay_start < 0:
		get_node("Tail").set_global_transform(array[0])
		array.remove(0)
	delay_start += -state.get_step()
	
	state.set_linear_velocity(force*speed*state.get_step())
	
func _ready():
	set_process_input(true)
	

