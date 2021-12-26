extends TextureButton

class_name Lampe

var an = false
var char_tex = load("res://assets/Tisch/LampeAn.png")

func an_aus_schalten():
	if an == false:
		an = true
		char_tex = load("res://assets/Tisch/LampeAn.png")
		set_normal_texture(char_tex)
		
	else:
		an = false
		char_tex = load("res://assets/Tisch/LampeAus.png")
		set_normal_texture(char_tex)
func _pressed ():
	an_aus_schalten()
