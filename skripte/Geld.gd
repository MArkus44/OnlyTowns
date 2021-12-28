extends Label

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	var geld_temp = str(get_geld())
	self.text = geld_temp
	
func get_geld():
	var Geld = get_parent().get_parent().get_parent().get_parent().get_geld()
	return Geld
