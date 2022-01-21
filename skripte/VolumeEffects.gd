extends HSlider

var Soundeffects
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	var LabelSound = $LabelEffects
	LabelSound.text = value as String
	if value == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Soundeffects"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Soundeffects"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Soundeffects"), linear2db(value/100))
		

func _ChangingVolEffectsByConfig(var VolEffects):
	value = float(VolEffects)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
