
extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var new_translation

func add_tail():
	var new_node = duplicate()
	add_child(new_node)

func _fixed_process(delta):
	set_translation(Vector3(0, 0, 2))

func _ready():
	set_fixed_process(true)


