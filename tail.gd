extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var array = []

var d = .2
func _process(delta):
	if get_child(0).get_child(0) != null:
		array.push_back(get_global_transform())
		d += -delta
	else:
		delta = 0
	if d < 0:
		if get_child(0).get_child(0) != null:
			get_child(0).get_child(0).set_global_transform(array[0])
			array.remove(0)
	

func _ready():
	set_process(true)
	pass




