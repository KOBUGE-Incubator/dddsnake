
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

func _process(delta):
	set_translation(get_parent().get_node("KinematicBody").get_translation())

func _ready():
	set_process(true)
	pass


