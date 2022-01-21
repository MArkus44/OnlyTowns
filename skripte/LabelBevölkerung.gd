extends Label

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	text = "Bevölkerung: " + str(get_parent().get_bevoelkerung())

func comma_sep(number):
	var string = str(int(number))
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += "."
		res += string[i]

	return res
