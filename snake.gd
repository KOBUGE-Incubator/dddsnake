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

var speed = .2
var tail
var d = .5
var x_axis_count = 0
var up_axis_count = 0
var down_axis_count = 0
var go_forward = true
var child_translation
var array = []
var count
func _input(ev):
	set_rotation(Vector3(.05, 0, 0))
	if (Input.is_action_pressed("ui_right")):
		go_right = true
		go_left = false
		go_up = false
		go_down = false
		go_forward = false
		x_axis_count += 1

	if (Input.is_action_pressed("ui_left")):
		go_right = false
		go_left = true
		go_up = false
		go_down = false
		go_forward = false
		x_axis_count += -1
	if (Input.is_action_pressed("ui_down")):
		go_up = false
		go_down = true

		up_axis_count = 0
		down_axis_count += 1
	if (Input.is_action_pressed("ui_up")):
		go_up = true
		go_down = false

		up_axis_count += 1
		down_axis_count = 0
		
func _fixed_process(delta):
	array.append(get_translation())
	count = 0
	if d < 0:
		count += 1
		get_node("Tail").global_translate(array[count])

	d += -delta
	if(!(go_up or go_down)):
		if(go_right == true):
			if(x_axis_count == 1):
#				set_rotation(Vector3(0, -1.571, 0))
				variable_z = speed
				move_snake(variable_z, 0, 0)
			elif(x_axis_count == 2):
				variable_x = speed
#				set_rotation(Vector3(0, 3.142, 0))
				move_snake(0, 0, variable_x)
			elif(x_axis_count == 3):

#				set_rotation(Vector3(0, 1.571, 0))
				move_snake(variable_z, 0, 0)
			elif(x_axis_count == 4):
				variable_x = -speed
				move_snake(0, 0, variable_x)
			else:
				x_axis_count = 1
			
		elif(go_left == true):
			if(x_axis_count == 1):
#				set_rotation(Vector3(0, -1.571, 0))
				variable_z = speed
				move_snake(variable_z, 0, 0)
			elif(x_axis_count == 2):
				variable_x = speed
#				set_rotation(Vector3(0, 3.142, 0))
				move_snake(0, 0, variable_x)
			elif(x_axis_count == 3):
				variable_z = -speed
#				set_rotation(Vector3(0, 1.571, 0))
				move_snake(variable_z, 0, 0)
			elif(x_axis_count == 4):
				variable_x = -speed
				move_snake(0, 0, variable_x)
			else:
				x_axis_count = 4
	elif (go_up == true):
		variable_y = speed
#		set_rotation(Vector3(1.571, 0, 0))
		move_snake(0, variable_y, 0)
		if(up_axis_count > 1):
			go_up = false
			up_axis_count = 0 

	elif(go_down == true):
		variable_y = -speed
#		set_rotation(Vector3(-1.571, 0, 0))
		move_snake(0, variable_y, 0)
		if(down_axis_count > 1):
			go_down = false
			down_axis_count = 0
	if((go_forward == true) and !(go_down or go_up)):
		variable_x = -speed
		move_snake(0, 0, variable_x)



func move_snake(variable_z, variable_y, variable_x):
	move( Vector3( variable_z, variable_y, variable_x))
	

func _ready():
	# Initialization here
	set_collide_with_static_bodies(true)
	set_fixed_process(true)
	set_process_input(true)

