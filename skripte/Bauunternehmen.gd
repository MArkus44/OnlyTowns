class_name Bauunternehmen

var name_unternehmen
var beschreibung
var multiplikator_geld
var multiplikator_bauzeit

func set_name(var new_name):
	name_unternehmen = new_name
	
func get_name():
	return name_unternehmen
	
func set_beschreibung(var new_beschreibung):
	beschreibung = new_beschreibung
	
func get_beschreibung():
	return beschreibung
	
func get_bauzeit():
	return beschreibung
	
func set_multiplikator_geld(var wert):
	multiplikator_geld = float(wert)
	
func get_multiplikator_geld():
	return multiplikator_geld
	
func set_multiplikator_bauzeit(var wert):
	multiplikator_bauzeit = float(wert)

func get_multiplikator_bauzeit():
	return multiplikator_bauzeit
