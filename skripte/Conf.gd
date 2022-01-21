extends ConfirmationDialog


var text = "Nix gut diese"
var id = 0
var bau_id
var close = get_close_button()
var ok = get_ok()
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
	get_ok().text = "Ja"
	get_cancel().text = "Nein"
# warning-ignore:return_value_discarded
	get_parent().get_node("Firma1").connect("bau_id1", self, "set_bau_id")
# warning-ignore:return_value_discarded
	get_parent().get_node("Firma2").connect("bau_id2", self, "set_bau_id")
# warning-ignore:return_value_discarded
	get_parent().get_node("Firma3").connect("bau_id3", self, "set_bau_id")
# warning-ignore:return_value_discarded
	get_parent().get_node("Firma4").connect("bau_id4", self, "set_bau_id")

func _on_PopupMenu_id_pressed(index):
	id = index

func set_text_dialog():
	var gebaeude = player.gebaeude_array[id].get_name_gebaeude()
#	var kosten = player.gebaeude_array[id].get_kosten() * player.bauunternehmen_array[bau_id].get_multiplikator_geld()
	dialog_text = "Möchten sie " + gebaeude + " wirklich bauen?" 

func comma_sep(number):
	var string = str(int(number))
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += "."
		res += string[i]
	return res

func set_bau_id(bau_idn):
	bau_id = bau_idn

func _on_ConfirmationDialog_confirmed():
	player.antrag_stellen(id)


# warning-ignore:unused_argument
func _on_Firma1_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		set_text_dialog()
		self.popup_centered()
