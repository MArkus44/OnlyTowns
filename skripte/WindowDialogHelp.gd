extends WindowDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	var spiellevel = get_node("/root/Options").get_level()
	if(spiellevel == "Leicht"):
		$Label2.text = "40%"
	elif(spiellevel == "Mittel"):
		$Label2.text = "50%"
	elif(spiellevel == "Schwer"):
		$Label2.text = "60%"
