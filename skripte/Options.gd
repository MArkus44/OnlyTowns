extends Node2D

var DateipfadOptions = "res://Config/OptionsData.cfg"
var confOptions = ConfigFile.new()
var loadResponse = confOptions.load(DateipfadOptions)
var Lautstaerke
var laufenderTitel
var laufendeMusiknummer
var ZeitpunktLaufendeMusik
var Helligkeit
var laufen
var VolumeSoundeffects


func _ready():
	Lautstaerke = confOptions.get_value("Options", "Volume")
	laufenderTitel = str(confOptions.get_value("Options", "Musiktitel"))
	laufendeMusiknummer = confOptions.get_value("Options", "Musiknummer")
	Helligkeit = confOptions.get_value("Options", "Helligkeit")
	VolumeSoundeffects = confOptions.get_value("Options", "VolumeEffects")
	
	if confOptions.get_value("Options", "laeuft") == 1:
		laufen = true
	else: laufen = false
	
	$Volume._ChangingVolumeByConfig(Lautstaerke)
	$Helligkeit._ChangingBrightnessByConfig(Helligkeit)
	$VolumeEffects._ChangingVolEffectsByConfig(VolumeSoundeffects)
	$"Music onoff".pressed = laufen
	
	
	


func saveGame():
	confOptions.set_value("Options", "Volume", $Volume.value)
	confOptions.set_value("Options", "Musiknummer", $"/root/MusicScene".currentTrack)
	confOptions.set_value("Options", "Helligkeit", $Helligkeit.value)
	confOptions.set_value("Options", "VolumeEffects", $VolumeEffects.value)
	if $"Music onoff".pressed == true:
			confOptions.set_value("Options", "laeuft", 1)
	else: confOptions.set_value("Options", "laeuft", 0)
	confOptions.save("res://Config/OptionsData.cfg")
	get_tree().change_scene("res://scenes/Menu.tscn")
