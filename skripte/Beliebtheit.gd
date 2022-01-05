extends ProgressBar

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	self.value = float(get_parent().get_parent().get_parent().get_parent().get_beliebtheit() * 100)

