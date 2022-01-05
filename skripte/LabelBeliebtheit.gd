extends Label


func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	text = "Beliebtheit: " + str(get_parent().get_beliebtheit()*100) + "%"
	
