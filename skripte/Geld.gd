extends Label

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	var geld_temp = str(get_parent().get_parent().get_parent().get_parent().get_geld())
	self.text =comma_sep(geld_temp) + " €"

func comma_sep(number):
	var string = str(int(number))
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]

	return res
