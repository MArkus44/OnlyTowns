extends AudioStreamPlayer


var SoundNumber
var Pfad = "res://configs/SoundData.cfg"
var configuration = ConfigFile.new()
var loadResponses = configuration.load(Pfad)
var Pathsound
var Sounddata


func _ready():
	pitch_scale = 1



func MausKlick():
	SoundNumber = 1
	Pathsound = str(configuration.get_value("Sound" + str(SoundNumber), "DateipfadSound"))
	Sounddata = load(Pathsound)
	stream = Sounddata
	stream.set_loop(false)
	play(0)



func AntragAngekommen():
	pass

func ShitHappens():
	pass

func Schredder():
	SoundNumber = 2
	Pathsound = str(configuration.get_value("Sound" + str(SoundNumber), "DateipfadSound"))
	Sounddata = load(Pathsound)
	stream = Sounddata
	stream.set_loop(false)
	play(0)

func LampeEin():
	SoundNumber = 3
	Pathsound = str(configuration.get_value("Sound" + str(SoundNumber), "DateipfadSound"))
	Sounddata = load(Pathsound)
	stream = Sounddata
	stream.set_loop(false)
	play(0)

func LampeAus():
	SoundNumber = 4
	Pathsound = str(configuration.get_value("Sound" + str(SoundNumber), "DateipfadSound"))
	Sounddata = load(Pathsound)
	stream = Sounddata
	stream.set_loop(false)
	play(0)




