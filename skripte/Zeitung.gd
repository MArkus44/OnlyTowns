extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(1,1,1)

# warning-ignore:unused_argument
func _process(delta):
	if (get_parent().get_notification() == true):
		modulate = Color(1,0,0)

func _pressed():
	get_parent().set_notification()
	get_parent().ereignis()
