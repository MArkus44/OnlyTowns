extends Label

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.text = str(get_bevoelkerung())
	print(get_bevoelkerung())
	
func get_bevoelkerung():
	var Geld = get_parent().get_parent().get_parent().get_parent().get_bevoelkerung()
	return Geld
