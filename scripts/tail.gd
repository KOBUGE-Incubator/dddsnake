extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var array = []

var delay_start = .5

# State refers to PhysicsBodyDirectState (look it up in api)
func _integrate_forces(state):
	if(state.get_contact_count() >= 1):
		get_tree().set_pause(true)
#	print(state.get_contact_count())

func _process(delta):
	# This handles how the tails follow each other.
	if get_child(0).get_child(0) != null:
		array.push_back(get_global_transform())
		delay_start += -delta
	else:
		delta = 0
	if delay_start < 0:
		if get_child(0).get_child(0) != null:
			get_child(0).get_child(0).set_global_transform(array[0])
			array.remove(0)
#Adds a tail to child of this node
func add_tail():
	var new_node = duplicate()
	get_child(0).add_child(new_node)

func _ready():
	set_process(true)




