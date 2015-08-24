
extends KinematicBody

# member variables here, example:
# var a=2
# var b="textvar"
var variable_x = 0
var variable_y = 0
var variable_z = 0
var go_right
var go_left
var go_up
var go_down
var go_backward
var go_forward
var speed = .2
var tail
var d = 0
var x_axis_count = 0


func _fixed_process(delta):
	set_rotation(Vector3(.05, 0, 0))
	if (Input.is_action_pressed(("ui_right"))):
		go_right = true
		go_left = false
		go_up = false
		go_down = false
		go_forward = false
		go_backward = false

	if (Input.is_action_pressed("ui_left")):
		go_right = false
		go_left = true
		go_up = false
		go_down = false
		go_forward = false
		go_backward = false
	if (Input.is_action_pressed("ui_up")):
		go_right = false
		go_left = false
		go_up = true
		go_down = false
		go_forward = false
		go_backward = false
	if (Input.is_action_pressed("ui_down")):
		go_right = false
		go_left = false
		go_up = false
		go_down = true
		go_forward = false
		go_backward = false
	if (Input.is_action_pressed("ui_forward")):
		go_right = false
		go_left = false
		go_up = false
		go_down = false
		go_forward = true
		go_backward = false
	if (Input.is_action_pressed("ui_backward")):
		go_right = false
		go_left = false
		go_up = false
		go_down = false
		go_forward = false
		go_backward = true


	if(go_right == true):
		set_rotation(Vector3(0, -1.571, 0))
		variable_z = speed
		move_snake(variable_z, 0, 0)
	if(go_left == true):
		variable_z = -speed
		set_rotation(Vector3(0, 1.571, 0))
		move_snake(variable_z, 0, 0)
	if (go_up == true):
		variable_y = speed
		set_rotation(Vector3(1.571, 0, 0))
		move_snake(0, variable_y, 0)
	if(go_down == true):
		variable_y = -speed
		set_rotation(Vector3(-1.571, 0, 0))
		move_snake(0, variable_y, 0)
	if(go_forward == true):
		variable_x = -speed
		set_rotation(Vector3(0, 0, 0))
		move_snake(0, 0, variable_x)
	if(go_backward == true):
		variable_x = speed
		set_rotation(Vector3(0, 3.142, 0))
		move_snake(0, 0, variable_x)


func move_snake(variable_z, variable_y, variable_x):
	move( Vector3( variable_z, variable_y, variable_x))
	

func _ready():
	# Initialization here
	set_collide_with_static_bodies(true)
	set_fixed_process(true)

