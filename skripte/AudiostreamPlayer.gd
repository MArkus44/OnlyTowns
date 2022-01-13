extends AudioStreamPlayer

var _spielt
var Tonstaerke
var Dateipfad = "res://configs/MusicData.cfg"
var conf = ConfigFile.new()
var load_response = conf.load(Dateipfad)


func _ready():
	pitch_scale=1
	volume_db=-60
	Tonstaerke = 30
	_spielt = false
	var Soundpfad = str(conf.get_value("Musikdateien", "DateipfadMusikLevel1"))
	var Sounddatei = load(Soundpfad)
	stream = Sounddatei



func _spiele():
	if is_playing() != true:
		_spielt = true 
		play(0)

func _anhalten():
	if is_playing() == true:
		_spielt = false
		stop()

func _aendereTonstaerke(Ton):
	Tonstaerke = Ton

func _AnAus():
	if is_playing() != true:
		_spielt = true 
		play(0)
	else:
		_spielt = false
		stop()
