extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Dateipfad = "res://configs/MusicData.cfg"
var conf = ConfigFile.new()
var loadResponse = conf.load(Dateipfad)
var Musiktitel
var Musiklaenge
var Soundpfad
var Sounddatei 
var Counter = 1
var Bestand = 0
var StartpunktnachLoeschen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func HinzufuegenSpeichern():
	var file = File.new()
	zaehleMusikbestand()
	Musiktitel = $MusiktitelInput.get_text()
	Soundpfad = "res://Hintergrundmusik/" + $MusikpfadInput.get_text()
	Musiklaenge = int($MusikLaengeInput.value)
	
	if file.file_exists(Soundpfad) && ueberpruefeDoppelteDateien(Soundpfad) == false && Musiklaenge > 60:
		$"/root/MusicScene".stop()
		$"/root/MusicScene".set_process(false)
		conf.set_value("Musikdatei" + str(Bestand+1), "Musiktitel", Musiktitel)
		conf.set_value("Musikdatei" + str(Bestand + 1), "DateipfadMusik", Soundpfad)
		conf.set_value("Musikdatei" + str(Bestand + 1), "LaengeMusik", Musiklaenge)
		
		conf.set_value("Musikdatei" + str(Bestand + 2), "Musiktitel", "null")
		conf.set_value("Musikdatei" + str(Bestand + 2), "DateipfadMusik", "null")
		conf.set_value("Musikdatei" + str(Bestand+2), "LaengeMusik", 0)
		
		conf.save("res://configs/MusicData.cfg")
		$Fehlermeldung.set_text("Die Musik wurde erfolgreich hinzugefügt!!!")
		$"/root/MusicScene".reloadConfig()
		$"/root/MusicScene".set_process(true)
		$"/root/MusicScene".play($"/root/MusicScene".get_playback_position())
	else:
		$Fehlermeldung.set_text("Die angegebene Musikdatei existiert nicht im Musikordner, ist bereits in der Playlist aufgelistet, oder die Länge der Musik wurde nicht korrekt festgelegt (Mindestlänge der Musik beträgt >60 sec)!!!")





func EntfernenSpeichern():
	var file = File.new()
	zaehleMusikbestand()
	Musiktitel = $MusiktitelLabel.get_text()
	Soundpfad = "res://Hintergrundmusik/" + $MusikpfadInput.get_text()
	
	
	if file.file_exists(Soundpfad):
		$"/root/MusicScene".stop()
		$"/root/MusicScene".set_process(false)
		
		for i in range(1, Bestand+1):
			if conf.get_value("Musikdatei" + str(i), "DateipfadMusik") == Soundpfad && conf.get_value("Musikdatei" + str(i), "DateipfadMusik") != "null":
				conf.erase_section("Musikdatei" + str(i))
				StartpunktnachLoeschen = i
				for z in range(i, Bestand+1):
					conf.set_value("Musikdatei" + str(z), "Musiktitel", conf.get_value("Musikdatei" + str(z+1), "Musiktitel"))
					conf.set_value("Musikdatei" + str(z), "DateipfadMusik", conf.get_value("Musikdatei" + str(z+1), "DateipfadMusik"))
					conf.set_value("Musikdatei" + str(z), "LaengeMusik", conf.get_value("Musikdatei" + str(z+1), "LaengeMusik"))
					
					if z == Bestand:
						conf.erase_section("Musikdatei" + str(Bestand + 1))
					
					
				
				
				
			
		
		conf.save("res://configs/MusicData.cfg")
		$"/root/MusicScene".reloadConfig()
		 
		if $"/root/MusicScene".currentTrack < StartpunktnachLoeschen:
			pass
		
		if $"/root/MusicScene".currentTrack == StartpunktnachLoeschen:
			$"/root/MusicScene".prepareTrack(StartpunktnachLoeschen, 0)
		
		if $"/root/MusicScene".currentTrack > StartpunktnachLoeschen:
			$"/root/MusicScene".currentTrack = $"/root/MusicScene".currentTrack - 1
		
		$Fehlermeldung.set_text("Die Musik wurde erfolgreich aus der Playlist entfernt!!!")
		
		$"/root/MusicScene".set_process(true)
		$"/root/MusicScene".play($"/root/MusicScene".get_playback_position())
		
		
		
		
	else:
		$Fehlermeldung.set_text("Die angegebene Musikdatei existiert nicht!!!")


func zaehleMusikbestand():
	while str(conf.get_value("Musikdatei"+str(Counter), "DateipfadMusik")) != "null":
		Bestand = Counter
		Counter = Counter + 1
	print(Bestand)
	Counter = 1

func ueberpruefeDoppelteDateien(var path):
	var TrueFalse = false
	while str(conf.get_value("Musikdatei" + str(Counter), "DateipfadMusik")) != "null":
		if conf.get_value("Musikdatei" + str(Counter), "DateipfadMusik") == str(path):
			TrueFalse = true
		
		Counter = Counter +1
	
	Counter = 1
	
	return TrueFalse
	

