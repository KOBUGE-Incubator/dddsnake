
extends Area

var snake
var score = 0
var lbl

func _ready():
	lbl = get_node("Node2D/Label")
	snake = get_node("../Snake")
	set_process(true)
	hide()
	# drandom start point
	set_translation(Vector3(rand_range(-20, 20), rand_range(-20, 20), rand_range(-20, 20)))
	show()

func _process(delta):
	if(get_overlapping_bodies().size() >= 1):
		consume_food()

# This function handles what happens when snake food is collected
func consume_food():
	score  = 1 + int(lbl.get_text())
	lbl.set_text(str(score))
	var new_node = duplicate()
	get_parent().add_child(new_node)
		
	var tail_node = snake.get_node("Tail")
	var curr = tail_node
	
	# Adds it to the end of the tail
	while(curr.get_child(0) != null):
		curr = curr.get_child(0)
		
	curr.get_parent().add_tail()

	queue_free()


