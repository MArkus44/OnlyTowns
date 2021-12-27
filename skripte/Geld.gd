extends Label

func _ready():
	pass # Replace with function body.

func _process(delta):
	var geld_temp = str(get_geld())
	var laenge = geld_temp.length()-1
	var array_geld_temp = []
	var runde = 1
	var runde_mal = int(laenge / 3)
	for c in geld_temp:
		array_geld_temp.append(c)
	
#	for i in range(runde_mal):
#		runde = runde + 1
#		var array_geld_temp2 = [laenge+1]
#		for k in range(laenge-3):
#			array_geld_temp2[k] = array_geld_temp[k]
#		array_geld_temp2[laenge - 3*runde + 3] = array_geld_temp[laenge - 3*runde + 2]
#		array_geld_temp2[laenge - 3*runde + 2] = array_geld_temp[laenge - 3*runde + 1]
#		array_geld_temp2[laenge - 3*runde + 1] = array_geld_temp[laenge - 3*runde + 0]
#		array_geld_temp2[laenge - 3*runde] = "."
#		laenge + 1
#		array_geld_temp = array_geld_temp2
	print(array_geld_temp)
	self.text = geld_temp
	
func get_geld():
	var Geld = get_parent().get_parent().get_parent().get_parent().get_geld()
	return Geld
