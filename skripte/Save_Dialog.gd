extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_close_button().visible = false

func _on_Save_pressed():
	self.popup_centered()
