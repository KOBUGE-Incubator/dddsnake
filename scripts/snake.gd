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
		right = true
	if(Input.is_action_pressed("ui_left")):
		left = true
	if(Input.is_action_pressed("ui_down")):
		down = true
	if(Input.is_action_pressed("ui_up")):
			up = true
func _fixed_process(delta):

	if (right):
		rotate_y(PI/2)
		force = force.rotated(Vector3(0,1,0), PI/2)
		right = false
	
	if (left):
		rotate_y(-PI/2)
		force = force.rotated(Vector3(0,1,0), -PI/2)
		left = false
	
	if (up):
		rotate_x(PI/2)
		force = force.rotated(Vector3(1,0,0), PI/2)
		up = false
	
	if (down):
		rotate_x(-PI/2)
		force = force.rotated(Vector3(1,0,0), -PI/2)
		down = false
	
	set_linear_velocity(force*speed*delta)
	
func _ready():
	set_process_input(true)
	set_fixed_process(true)

