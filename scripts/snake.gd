extends KinematicBody

# controls
var go_right
var go_left
var go_up
var go_down
var go_backward

var delay_start = .42
var speed = .2
var tail
var x_axis_count = 0
var up_axis_count = 0
var down_axis_count = 0

var up_locked = false
var down_locked = false
# Set at the beginning in order to make the snake automatically start moving forward
var go_forward = true
var array = []

func _input(ev):
	set_rotation(Vector3(.05, 0, 0))
	if (Input.is_action_pressed("ui_right")):
		go_right = true
		go_left = false
		go_up = false
		go_down = false
		go_forward = false
		up_locked = false
		down_locked = false
		x_axis_count += 1

	if (Input.is_action_pressed("ui_left")):
		go_right = false
		go_left = true
		go_up = false
		go_down = false
		go_forward = false
		up_locked = false
		down_locked = false
		x_axis_count += -1
	if (Input.is_action_pressed("ui_down") and up_locked == false):
		go_up = false
		go_down = true
		down_locked = true

		up_axis_count = 0
		down_axis_count += 1
	if (Input.is_action_pressed("ui_up") and down_locked == false):
		go_up = true
		go_down = false
		up_locked = true
		up_axis_count += 1
		down_axis_count = 0
	
func _fixed_process(delta):
	print(is_colliding())
	array.push_back(get_global_transform())
	if delay_start < 0:
		get_node("Tail").set_global_transform(array[0])
		array.remove(0)

	delay_start += -delta
	if(!(go_up or go_down)):
		if(go_right == true):
			if(x_axis_count == 1):
#				set_rotation(Vector3(0, -1.571, 0))
				move_snake(speed, 0, 0)
			elif(x_axis_count == 2):
#				set_rotation(Vector3(0, 3.142, 0))
				move_snake(0, 0, speed)
			elif(x_axis_count == 3):
#				set_rotation(Vector3(0, 1.571, 0))
				move_snake(-speed, 0, 0)
			elif(x_axis_count == 4):
				move_snake(0, 0, -speed)
			else:
				x_axis_count = 1
			
		elif(go_left == true):
			if(x_axis_count == 1):
#				set_rotation(Vector3(0, -1.571, 0))
				move_snake(speed, 0, 0)
			elif(x_axis_count == 2):
#				set_rotation(Vector3(0, 3.142, 0))
				move_snake(0, 0, speed)
			elif(x_axis_count == 3):
#				set_rotation(Vector3(0, 1.571, 0))
				move_snake(-speed, 0, 0)
			elif(x_axis_count == 4):
				move_snake(0, 0, -speed)
			else:
				x_axis_count = 4
	elif (go_up == true):
#		set_rotation(Vector3(1.571, 0, 0))
		move_snake(0, speed, 0)
		if(up_axis_count > 1):
			go_up = false
			up_axis_count = 0 
			up_locked = false

	elif(go_down == true):
#		set_rotation(Vector3(-1.571, 0, 0))
		move_snake(0, -speed, 0)
		if(down_axis_count > 1):
			go_down = false
			down_axis_count = 0
			down_locked = false
	if((go_forward == true) and !(go_down or go_up)):
		move_snake(0, 0, -speed)



func move_snake(variable_z, variable_y, variable_x):
	move( Vector3( variable_z, variable_y, variable_x))
	

func _ready():
	# Initialization here
	set_collide_with_rigid_bodies(true)
	set_fixed_process(true)
	set_process_input(true)

