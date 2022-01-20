extends HSlider

signal Volchanged


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Volumeclass")


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var my_label=$Zahl
	my_label.text = value as String
	if value == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	else: 
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(value/100))
	

func _ChangingVolumeByConfig(var Vol):
	value = float(Vol)




