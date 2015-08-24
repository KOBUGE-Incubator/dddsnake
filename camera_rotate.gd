
extends Camera

# member variables here, example:
# var a=2
# var b="textvar"
var r_pos = Vector2()
var x_pos = get_translation().x
var y_pos = get_translation().y
var d = 0
func _process(delta):
	d += delta
	if(Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


	if(abs(r_pos.x) > 2):
		x_pos += r_pos.x/300
	if(abs(r_pos.y) > 2):
		y_pos += r_pos.y/300
	
	look_at(get_parent().get_translation(), Vector3(0, 1, 0))
	
	set_translation(Vector3(cos(x_pos)*10, 5, sin(x_pos)*10))
	

func _input( event ):
	if(event.type == InputEvent.MOUSE_MOTION):
		r_pos = event.relative_pos

func _ready():
	set_process(true)
	set_process_input(true)


