extends ConfirmationDialog


var text = "Nix gut diese"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_ok().text = "Ja"
	get_cancel().text = "Nein"
	self.rect_position = Vector2(1920/2-100,1080/2-100)


func _on_PopupMenu_id_pressed(id):
	var gebaude = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().antrag_gebaeude(id)
	var kosten =comma_sep(str((get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_kosten())*-1))
	dialog_text = "Möchten sie " + gebaude + " für " + kosten + " € wirklich bauen?" 
	popup()

func comma_sep(number):
	var string = str(number)
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]

	return res
