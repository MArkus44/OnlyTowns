extends Label






func _ready():
	pass

func display():
	if $"/root/MusicScene".is_processing() == true:
		text = "Es läuft:      " + $"/root/MusicScene".getMusiktitel()
	else: 
		text = ""

# warning-ignore:unused_argument
func _process(delta):
	display()




