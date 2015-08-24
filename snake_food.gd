
extends StaticBody

# member variables here, example:
# var a=2
# var b="textvar"

func _process(delta):
	if (get_node("../KinematicBody").is_colliding()):
		consume_food()

func consume_food():
	var new_node = duplicate()
	get_parent().add_child(new_node)
	
	get_parent().get_node("KinematicBody").get_node("Tail").add_tail()
	
	queue_free()
	
func _ready():
	set_process(true)
	hide()
	set_translation(Vector3(rand_range(-20, 20), rand_range(-20, 20), rand_range(-20, 20)))
	show()

