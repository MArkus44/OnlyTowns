extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _pressed():
# warning-ignore:return_value_discarded
	$"/root/Soundeffects".MausKlick()
	get_tree().change_scene("res://scenes/Options.tscn")
