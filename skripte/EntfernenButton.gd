extends Button

onready var Options22 = get_parent()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	$"/root/Soundeffects".MausKlick()
	Options22.EntfernenSpeichern()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
