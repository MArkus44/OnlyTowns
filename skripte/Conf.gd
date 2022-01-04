extends ConfirmationDialog


var text = "Nix gut diese"
var id = 0
var close = get_close_button()
var ok = get_ok()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_ok().text = "Ja"
	get_cancel().text = "Nein"

func _on_PopupMenu_id_pressed(index):
	id = index
	close.visible = true
	ok.visible = true
	print(str(get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_level()) + "zu" + str(get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_level()))
	if (get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_level() >= get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_level()):
		var kosten =comma_sep(str((get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_kosten())*-1))
		var gebaeude = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_name_gebaeude()
		dialog_text = "Möchten sie " + gebaeude + " für " + kosten + " € wirklich bauen?" 
		popup_centered()
	else:
		var level = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_level()
		dialog_text = "Du brauchst Level " + str(level) + " um dieses Gebäude zu bauen"
		close.visible = false
		remove_button(close)
		ok.visible = false
		remove_button(ok)
		popup_centered()

func comma_sep(number):
	var string = str(number)
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]
	return res


func _on_ConfirmationDialog_confirmed():
	get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().antrag_stellen(id)
	$WindowDialog.popup_centered()
