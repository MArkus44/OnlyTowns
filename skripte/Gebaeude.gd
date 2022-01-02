extends Node2D

class_name Gebaeude

var name_gebaeude
var kosten
var geld_einfluss
var beliebtheit_einfluss
var bevoelkerung_einfluss
var level
var bauzeit
var spezifischer_faktor
var typ #	0 = "Wohngebäude"; 1 = "Wirtschaftsgebäude"
var zustand # 	0 = "nicht gebaut"; 0 - 100 = "gebaut"; 100 = "neu gebaut, Startwert"
var index

func get_geld_einfluss():
	return geld_einfluss
	
func set_geld_einfluss(var wert):
	geld_einfluss = int(wert)
	
func set_beliebtheit_einfluss(var wert):
	beliebtheit_einfluss = int(wert)
	
func get_beliebtheit_einfluss():
	return beliebtheit_einfluss
	
func set_bevoelkerung_einfluss(var wert):
	bevoelkerung_einfluss = int(wert)
	
func get_bevoelkerung_einfluss():
	return bevoelkerung_einfluss

func get_zustand():
	return zustand

func set_zustand(var wert):
	zustand = int(wert)
	
func set_name_gebaeude(var wert):
	name_gebaeude = wert
	
func get_name_gebaeude():
	return name_gebaeude

func set_kosten(var wert):
	kosten = int(wert)
	
func get_kosten():
	return kosten
	
func set_level(var wert):
	level = int(wert)
	
func get_level():
	return level
	
func set_bauzeit(var wert):
	bauzeit = int(wert)
	
func get_bauzeit():
	return bauzeit
	
func set_spezifischer_faktor(var wert):
	spezifischer_faktor = wert
	
func get_spezifischer_faktor():
	return spezifischer_faktor
	
func set_typ(var wert):
	typ = wert
	
func get_typ():
	return typ
	
func set_index(var wert):
	index = wert
	
func get_index():
	return index
