extends ProgressBar

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.value = get_beliebtheit()
	
func get_beliebtheit():
	var beliebtheit = get_parent().get_parent().get_parent().get_parent().get_beliebtheit()
	return beliebtheit