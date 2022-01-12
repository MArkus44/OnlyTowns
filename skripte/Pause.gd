extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ok():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")

func _pressed():
	$ConfirmationDialog.get_ok().text = "Ja"
	$ConfirmationDialog.get_cancel().text = "Nein"
	$ConfirmationDialog.popup_centered()
