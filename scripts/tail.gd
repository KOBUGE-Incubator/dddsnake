extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var array = []

var delay_start = .2
var snake
# State refers to PhysicsBodyDirectState (look it up in api)
func _integrate_forces(state):
	for i in range(state.get_contact_count()):
		var cc = state.get_contact_collider_object(i)
		if (cc):
		#This part is weird, if the objects extends snake.gd then kill the game (because the head is the only object that extends it.
		#Found how to do this in the 3d platformer demo enemy.gd
			if (cc extends preload("res://scripts/snake.gd")):
				print("BOOM")
				set_process(false)
				state.add_force(Vector3(rand_range(0, 3), rand_range(0, 3), rand_range(0, 3)), Vector3(rand_range(0, 3), rand_range(0, 3), rand_range(0, 3)))
#	if((state.get_contact_count() >= 1)):
#		get_tree().set_pause(true)
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
	if snake == null:
		snake = get_parent()




