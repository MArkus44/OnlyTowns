extends Button

onready var Optionen = get_parent()

func _ready():
	pass

func _pressed():
# warning-ignore:return_value_discarded
	$"/root/Soundeffekte".MausKlick()
	Optionen.saveGame()

