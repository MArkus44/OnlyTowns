extends Node2D

var name_ereignis
var level
var dauer
var einkommen_einfluss
var geld_einfluss
var bevoelkerung_einfluss
var beliebtheit_einfluss
var kaputt
var antraege_verzoegerung


func set_name_ereignis(var wert):
	name_ereignis = wert
	
func get_name_ereignis():
	return name_ereignis

func set_level(var wert):
	level = int(wert)
	
func get_level():
	return level
	
func set_dauer(var wert):
	dauer = int(wert)
	
func get_dauer():
	return dauer

func set_einkommen_einfluss(var wert):
	einkommen_einfluss = int(wert)
	
func get_einkommen_einfluss():
	return einkommen_einfluss
	
func get_geld_einfluss():
	return geld_einfluss
	
func set_geld_einfluss(var wert):
	geld_einfluss = int(wert)

func set_bevoelkerung_einfluss(var wert):
	bevoelkerung_einfluss = int(wert)
	
func get_bevoelkerung_einfluss():
	return bevoelkerung_einfluss
	
func set_beliebtheit_einfluss(var wert):
	beliebtheit_einfluss = int(wert)
	
func get_beliebtheit_einfluss():
	return beliebtheit_einfluss
	
func set_kaputt(var wert):
	kaputt = wert
	
func get_kaputt():
	return kaputt

func set_antraege_verzoegerung(wert):
	antraege_verzoegerung = wert
	
func get_antraege_verzoegerung():
	return antraege_verzoegerung
