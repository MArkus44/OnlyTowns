extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	var geld_temp = str(get_parent().get_geld())
	if(int(geld_temp) < 0):
		self.text ="Geld: " + comma_sep(geld_temp) + " €"
	else:
		self.text ="Geld: " + comma_sep(geld_temp) + " €"

func comma_sep(number):
	var string = str(number)
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += "."
		res += string[i]

	return res
