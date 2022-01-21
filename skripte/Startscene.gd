extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var DateipfadOptions = "res://configs/OptionsData.cfg"
	var confOptions = ConfigFile.new()
# warning-ignore:unused_variable
	var loadResponse = float(confOptions.load(DateipfadOptions))
	var Lautstaerke = int(confOptions.get_value("Options", "Volume"))
# warning-ignore:unused_variable
	var Helligkeit = float(confOptions.get_value("Options", "Helligkeit"))
	var laufendeMusiknummer = float(confOptions.get_value("Options", "Musiknummer"))
# warning-ignore:unused_variable
	var laufen
	var LautstaerkeEffekte = float(confOptions.get_value("Options", "VolumeEffects"))
	
	$"/root/MusicScene".prepareTrack(laufendeMusiknummer, 0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(1))
	
	if float(confOptions.get_value("Options", "laeuft")) == 1:
		$"/root/MusicScene"._spiele()
	
	if Lautstaerke == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	else: 
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(Lautstaerke/100))
	
	
	
	
	
	if LautstaerkeEffekte == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Soundeffects"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Soundeffects"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Soundeffects"), linear2db(LautstaerkeEffekte/100))
	
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
