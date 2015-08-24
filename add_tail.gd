
extends MeshInstance

# member variables here, example:
# var a=2
# var b="textvar"

func add_tail():
	var new_node = get_parent().duplicate()
	add_child(new_node)

func _ready():
	
	pass


