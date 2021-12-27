extends Label

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.text = str(get_geld())
	
func get_geld():
	var Geld = get_parent().get_parent().get_parent().get_parent().get_geld()
	return Geld
