extends ConfirmationDialog


var text = "Nix gut diese"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_ok().text = "Ja"
	get_cancel().text = "Nein"
	self.rect_position = Vector2(1920/2-100,1080/2-100)


func _on_PopupMenu_id_pressed(id):
	var gebaude = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().antrag_gebaeude(id)
	var kosten = str((get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().gebaeude_array[id].get_kosten())*-1)
	dialog_text = "Möchten sie " + gebaude + " für " + kosten + " € wirklich bauen?" 
	popup()
