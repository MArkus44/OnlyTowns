extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_close_button().visible = false


# warning-ignore:unused_argument
func _on_TextureRect_gui_input(event):
	hide()
