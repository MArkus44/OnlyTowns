extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# warning-ignore:unused_argument
func _process(delta):
	if(get_parent().get_level() == 11):
		text = "Level: final"
	else:
		text = "Level: " + str(get_parent().get_level())
