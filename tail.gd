extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var d = .5
func _process(delta):
	d += -delta
	if d < 0:
		if get_child(0).get_child(0) != null:
			get_child(0).get_child(0).set_translation(get_parent().get_node("KinematicBody").get_translation())

func _ready():
	set_process(true)
	pass




