extends Label

signal bau_id4(bau_id)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_Firma4_gui_input(event):
	emit_signal("bau_id4", 4 )
