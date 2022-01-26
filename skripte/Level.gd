extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	var level = get_node("/root/Options").get_level()
	if(level == "Leicht"):
		value = 0
		$Label.text = "Leicht"
	elif(level == "Mittel"):
		value = 1
		$Label.text = "Mittel"
	elif(level == "Schwer"):
		value = 2
		$Label.text = "Schwer"

func _on_Level_changed(value):
	if(value == 0):
		$Label.text = "Leicht"
		get_node("/root/Options").set_level("Leicht")
		get_parent().set_level("Leicht")
	elif(value == 1):
		$Label.text = "Mittel"
		get_node("/root/Options").set_level("Mittel")
		get_parent().set_level("Mittel")
	elif(value == 2):
		$Label.text = "Schwer"
		get_node("/root/Options").set_level("Schwer")
		get_parent().set_level("Schwer")
