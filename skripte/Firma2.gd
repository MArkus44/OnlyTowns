extends Label

var n2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_Firma2_gui_input(event):
	var conf = get_parent().get_node("ConfirmationDialog")
	conf.bau_id = n2

func set_n(nn2):
	n2 = nn2
