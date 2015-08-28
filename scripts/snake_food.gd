
extends StaticBody


func _process(delta):
	if (get_node("../KinematicBody").is_colliding()):
		consume_food()

# This function handles what happens when snake food is collected
func consume_food():
	var new_node = duplicate()
	get_parent().add_child(new_node)
		
	var tail_node = get_parent().get_node("KinematicBody").get_node("Tail")
	
	var curr = tail_node
	
	# Adds it to the end of the tail
	while(curr.get_child(0) != null):
		curr = curr.get_child(0)
		
	curr.get_parent().add_tail()
	queue_free()


func _ready():
	set_process(true)
	hide()
	# drandom start point
	set_translation(Vector3(rand_range(-20, 20), rand_range(-20, 20), rand_range(-20, 20)))
	show()

