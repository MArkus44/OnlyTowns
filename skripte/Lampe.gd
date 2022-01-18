extends TextureButton

var an = false

func an_aus_schalten():
	if an == false:
		an = true
		set_normal_texture(load("res://assets/Tisch/LampeAn.png"))
		
	else:
		an = false
		set_normal_texture(load("res://assets/Tisch/LampeAus.png"))
func _pressed ():
	an_aus_schalten()
