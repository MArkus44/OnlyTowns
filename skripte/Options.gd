extends Node2D

var DateipfadOptions = "res://configs/OptionsData.cfg"
var confOptions = ConfigFile.new()
var loadResponse = confOptions.load(DateipfadOptions)
var Lautstaerke
var laufenderTitel
var laufendeMusiknummer
var ZeitpunktLaufendeMusik
var Helligkeit
var Level
var laufen
var VolumeSoundeffects


func _ready():
	Lautstaerke = confOptions.get_value("Options", "Volume")
#	laufenderTitel = str(confOptions.get_value("Options", "Musiktitel"))
	laufendeMusiknummer = confOptions.get_value("Options", "Musiknummer")
	Helligkeit = confOptions.get_value("Options", "Helligkeit")
	VolumeSoundeffects = confOptions.get_value("Options", "VolumeEffects")
	Level = confOptions.get_value("Options", "Level")
#	if(Level == "Leicht"):
#		$Level.value = 0
#	elif(Level == "Mittel"):
#		$Level.value = 1
#	elif(Level == "Schwer"):
#		$Level.value = 2
	
	if int(confOptions.get_value("Options", "laeuft")) == 1:
		laufen = true
	else: laufen = false
	
	$Volume._ChangingVolumeByConfig(Lautstaerke)
	$Helligkeit._ChangingBrightnessByConfig(Helligkeit)
	$VolumeEffects._ChangingVolEffectsByConfig(VolumeSoundeffects)
	$"Music onoff".pressed = laufen
	

func set_level(level):
	Level = level

func get_level():
	return Level

func saveGame():
	confOptions.set_value("Options", "Volume", $Volume.value)
	confOptions.set_value("Options", "Musiknummer", $"/root/MusicScene".currentTrack)
	confOptions.set_value("Options", "Helligkeit", $Helligkeit.value)
	confOptions.set_value("Options", "VolumeEffects", $VolumeEffects.value)
	confOptions.set_value("Options", "Level", Level)
	if $"Music onoff".pressed == true:
			confOptions.set_value("Options", "laeuft", 1)
	else: confOptions.set_value("Options", "laeuft", 0)
	confOptions.save("res://configs/OptionsData.cfg")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")
