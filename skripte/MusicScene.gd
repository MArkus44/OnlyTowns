extends AudioStreamPlayer

var Dateipfad = "res://configs/MusicData.cfg"
var conf = ConfigFile.new()
var loadResponse = conf.load(Dateipfad)
var currentTrack
var LocationTrack
var Musiktitel
var Soundpfad
var Sounddatei
var StreamVolume = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pitch_scale = 1
	set_process(!is_processing())
	



func _spiele():
	if is_playing() != true:
		play(LocationTrack)
		set_process(true)

func _anhalten():
	if is_playing() == true:
		stop()
		LocationTrack = get_playback_position()
		set_process(false)

func getZeitpunkt():
	LocationTrack = get_playback_position()
	return LocationTrack


func prepareTrack(var Tracknumber, var Loc):
	currentTrack = Tracknumber
	LocationTrack = Loc
	Soundpfad = str(conf.get_value("Musikdatei" + str(currentTrack), "DateipfadMusik"))
	Sounddatei = load(Soundpfad)
	stream = Sounddatei


func getMusiktitel():
	if str(conf.get_value("Musikdatei"+str(currentTrack), "Musiktitel")) == "null":
		return str(conf.get_value("Musikdatei"+str(1), "Musiktitel"))
	else:
		return str(conf.get_value("Musikdatei"+str(currentTrack), "Musiktitel"))




# warning-ignore:unused_argument
func _process(delta):
	if str(conf.get_value("Musikdatei" + str(currentTrack), "DateipfadMusik")) != "null":
		if get_playback_position() >= float(conf.get_value("Musikdatei" + str(currentTrack), "LaengeMusik")):
			currentTrack = currentTrack + 1 
			stop()
			Soundpfad = str(conf.get_value("Musikdatei" +str(currentTrack), "DateipfadMusik"))
			Sounddatei = load(Soundpfad)
			stream = Sounddatei
			play(0)
		
		if get_playback_position() + 20 >= float(conf.get_value("Musikdatei" + str(currentTrack), "LaengeMusik")):
			VolumeDown()
		else:
			VolumeUp()
		
	else:
		currentTrack = 1
		Soundpfad = str(conf.get_value("Musikdatei" +str(currentTrack), "DateipfadMusik"))
		Sounddatei = load(Soundpfad)
		stream = Sounddatei
		play(0)

func VolumeDown():
	if StreamVolume-0.001 >= 0:
		StreamVolume = StreamVolume-0.001
		volume_db = linear2db(StreamVolume)


func VolumeUp():
	if StreamVolume + 0.001 <= 1:
		StreamVolume = StreamVolume+0.001
		volume_db = linear2db(StreamVolume)

func reloadConfig():
	conf = ConfigFile.new()
	loadResponse = conf.load(Dateipfad)

