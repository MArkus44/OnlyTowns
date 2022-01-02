extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	modulate = Color(1,1,1)

# warning-ignore:unused_argument
func _process(delta):
	if (get_parent().get_notification() == true):
		modulate = Color(1,0,0)
	else:
		modulate = Color(1,1,1)

func _pressed():
	$WindowDialog.popup_centered()
	$WindowDialog/Label.text = "Name: " + get_parent().get_ereignis_name() + "Level: " + str(get_parent().get_ereignis_level()) + "Dauer: " + str(get_parent().get_ereignis_dauer()) + "Einkommen Einfluss: " + str(get_parent().get_ereignis_einkommen_einfluss()) + "Geld Einfluss: " + str(get_parent().get_ereignis_geld_einfluss()) + "Bevölkerung Einfluss: " + str(get_parent().get_ereignis_bevoelkerung_einfluss()) + "Beliebtheit Einfluss: " + str(get_parent().get_ereignis_beliebtheit_einfluss()) + "Kaputt: " + str(get_parent().get_ereignis_kaputt()) + "Antraege Verzögerung: " + str(get_parent().get_ereignis_antraege_verzoegerung())
