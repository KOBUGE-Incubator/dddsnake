
extends Spatial

var r_pos = Vector2()
var state
var orig_state = get_rotation()

const STATE_MENU=0
const STATE_GRAB=1

func direction(vector):
#	var v = get_global_transform().basis * vector
#	v = v.normalized()
#	
#	return v
#
#
#func impulse(event, action):
#	if(event.is_action(action) && event.is_pressed() && !event.is_echo()):
#		return true
#	else:
#		return false
#
#
#func _fixed_process(delta):
#
	if(Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	
#	var dir = Vector3() 
#	var cam = get_global_transform()
#	var org = get_translation()

	dir = dir.normalized()
	
	var d = delta * 0.1

	if(abs(r_pos.x) > 10):
		var yaw = get_transform().rotated(Vector3(0,orig_state.x,0), d * (r_pos.x*2))
		set_transform(yaw)
		
	if(abs(r_pos.y) > 10):
		var pitch = get_transform().rotated(Vector3(orig_state.y,0,0), d * (r_pos.y*2))
		set_transform(pitch)
		print("pitch: ")
		print(pitch)
	
	
	r_pos.x = 0.0
	r_pos.y = 0.0


func _input( event ):
	if(event.type == InputEvent.MOUSE_MOTION):
		r_pos = event.relative_pos
	
	if(impulse(event, "ui_cancel")):
		if(state == STATE_GRAB):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			state = STATE_MENU
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			state = STATE_GRAB


func _ready():
	set_fixed_process(true)
	set_process_input(true)
	

