
extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var new_translation

func _fixed_process(delta):
	set_translation(Vector3(0, 0, 4))

func _ready():
	set_fixed_process(true)


