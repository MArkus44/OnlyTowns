extends Node2D

var name_ereignis
var geld_einfluss
var beliebtheit_einfluss
var bevoelkerung_einfluss
var kosten
var level
var bauzeit

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
	
func set_name_ereignis(var wert):
	name_ereignis = wert
	
func get_name_ereignis():
	return name_ereignis

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
