extends ProgressBar

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	self.value = get_beliebtheit()*100
	
func get_beliebtheit():
	var beliebtheit = get_parent().get_parent().get_parent().get_parent().get_beliebtheit()
	return beliebtheit
