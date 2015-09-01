extends RigidBody

# controls
var delay_start = .42
var speed = 100
var force = Vector3(0,0,-1)
# Set at the beginning in order to make the snake automatically start moving forward
var array = []
var right
var right_prev = false
var left
var left_prev = false
var up
var up_prev = false
var down
var down_prev = false

func _fixed_process(delta):
	right = Input.is_action_pressed("ui_right")
	if (right and not right_prev):
		rotate_y(PI/2)
		force = force.rotated(Vector3(0,1,0), PI/2)
	right_prev = right
	
	left = Input.is_action_pressed("ui_left")
	if (left and not left_prev):
		rotate_y(-PI/2)
		force = force.rotated(Vector3(0,1,0), -PI/2)
	left_prev = left
	
	up = Input.is_action_pressed("ui_up")
	if (up and not up_prev):
		rotate_x(PI/2)
		force = force.rotated(Vector3(1,0,0), PI/2)
	up_prev = up
	
	down = Input.is_action_pressed("ui_down")
	if (down and not down_prev):
		rotate_x(-PI/2)
		force = force.rotated(Vector3(1,0,0), -PI/2)
	down_prev = down
	
	set_linear_velocity(force*speed*delta)
	
func _ready():
	set_fixed_process(true)

