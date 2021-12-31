extends Node2D

var b_config = "res://configs/Bauunternehmen.cfg"
var g_config = "res://configs/Gebaeude.cfg"
var e_config = "res://configs/Ereignisse.cfg"

var geld = 0
var beliebtheit = 0.54
var bevoelkerung = 1000
var levelSpieler = 1

var zeit = 0

var zeit_zwischen_gebauede = 12
var tmp_zeit_gebauede = zeit
var zeit_zwischen_mitteilungen = 6
var tmp_zeit_mitteilungen = zeit
var zeit_zwischen_steuern = 6
var tmp_zeit_steuern = zeit
var GebaeudeIndex = 0

var gebaeude_gebaut = []
var gebaeude_ausstehend = []
var gebaeude_array = []
# var gebaeude_uebrig = []

var bauunternehmen_array = []
const Bauunternehmen = preload("res://skripte/Bauunternehmen.gd")
const Gebaeude = preload("res://skripte/Gebaeude.gd")
const Ereignisse = preload("res://skripte/Ereignisse.gd")
# var antrag_tmp = Antrag.new()

func _ready():
	print("Running.")
	setup()
	load_game()
	#connect("GebaeudeIndex",self,antrag_gebaeude(GebaeudeIndex))
	set_geld_com(0)
	set_beliebtheit_com(0.51)
	set_bevoelkerung_com(1000)
	set_level_com(2)

func setup():
	hinzufuegen()

func _process(delta):
	zeit += delta  # in Sekunden
	set_level()
	geld_einfluss_gebaeude()
	neuer_regelmaessige_mitteilung()
	steuern()
	
	for i in gebaeude_ausstehend:
		if int(i.split(';')[1]) <= zeit:
			print(gebaeude_array[int(i.split(';')[0])].get_name_gebaeude())
			bevoelkerung += gebaeude_array[int(i.split(';')[0])].get_bevoelkerung_einfluss()
			beliebtheit += gebaeude_array[int(i.split(';')[0])].get_beliebtheit_einfluss()
			print(typeof(gebaeude_array[int(i.split(';')[0])]))
			gebaeude_gebaut.append(gebaeude_array[int(i.split(';')[0])])
			gebaeude_ausstehend.remove(gebaeude_ausstehend.find(i))
			print(beliebtheit)
	#print(geld)

func hinzufuegen():
	var config = ConfigFile.new()
	var err = config.load(b_config)
	var anzahl = config.get_value("Anzahl", "anzahl_unternehmen")
	if err == 0:
		for i in range(anzahl):
			var bauunternehmen = Bauunternehmen.new()
			var name = config.get_value(str(i + 1), "name_unternehmen")
			bauunternehmen.set_name(name)
			bauunternehmen_array.append(name)
	
	config = ConfigFile.new()
	err = config.load(g_config)
	anzahl = config.get_value("Anzahl", "anzahl_gebaeude")
	if err == 0:
		for i in range(anzahl):
			var gebaeude = Gebaeude.new()
			var name = config.get_value(str(i + 1), "name_gebaeude")
			var kosten = config.get_value(str(i + 1), "kosten")
			var geld_einfluss = config.get_value(str(i + 1), "geld_einfluss")
			var beliebtheit_einfluss = config.get_value(str(i + 1), "beliebtheit_einfluss")
			var bevoelkerung_einfluss = config.get_value(str(i + 1), "bevoelkerung_einfluss")
			var level = config.get_value(str(i + 1), "level")
			var bauzeit = config.get_value(str(i + 1), "bauzeit")
			var spezifischer_faktor = config.get_value(str(i + 1), "spezifischer_faktor")
			var typ = int(config.get_value(str(i + 1), "typ"))
			gebaeude.set_name_gebaeude(name)
			gebaeude.set_kosten(int(kosten))
			gebaeude.set_geld_einfluss(int(geld_einfluss))
			gebaeude.set_beliebtheit_einfluss(int(beliebtheit_einfluss))
			gebaeude.set_bevoelkerung_einfluss(int(bevoelkerung_einfluss))
			gebaeude.set_level(int(level))
			gebaeude.set_bauzeit(int(bauzeit))
			gebaeude.set_spezifischer_faktor(int(spezifischer_faktor))
			gebaeude.set_typ(int(typ))
			
			if typ == 0:
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Wohngebaeude/PopupMenu".add_item(name, i, 0)
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Wohngebaeude/PopupMenu".add_separator()
			elif typ == 1:
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Wirtschaftsgebaeude/PopupMenu".add_item(name, i, 0)
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Wirtschaftsgebaeude/PopupMenu".add_separator()
			elif typ == 2:
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Freizeitgebaeude/PopupMenu".add_item(name, i, 0)
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Freizeitgebaeude/PopupMenu".add_separator()
			else:
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Infrastruktur/PopupMenu".add_item(name, i, 0)
				$"Bildschirm/BildschirmBild/WindowBildschirm/Anträge/WindowAntraege/Infrastruktur/PopupMenu".add_separator()
			gebaeude_array.append(gebaeude)
				
func geld_einfluss_gebaeude():
	if zeit >= tmp_zeit_gebauede + zeit_zwischen_gebauede:
		tmp_zeit_gebauede += zeit_zwischen_gebauede
		# print("Gebaeude.")
		for i in gebaeude_gebaut:
			geld += i.get_geld_einfluss()
			
func steuern():
	if zeit >= tmp_zeit_steuern + zeit_zwischen_steuern:
		# print("Steuern.")
		tmp_zeit_steuern += zeit_zwischen_steuern
		geld += 1000 * bevoelkerung * beliebtheit
			
func neuer_regelmaessige_mitteilung():
	if zeit >= tmp_zeit_mitteilungen + zeit_zwischen_mitteilungen:
		tmp_zeit_mitteilungen += zeit_zwischen_mitteilungen
	# mitteilungen_uebrig[0].anzeigen()
	
func antrag_gebaeude(index):
	print(gebaeude_array[index].get_name_gebaeude())
	return gebaeude_array[index].get_name_gebaeude()
	
func antrag_stellen(index):
	var rn = RandomNumberGenerator.new().randi_range(0, 100)
	if rn * beliebtheit > 40:
		gebaeude_ausstehend.append(str(index) + ';' + str((gebaeude_array[index].get_bauzeit()) + zeit))
		print(gebaeude_array[int(gebaeude_ausstehend[-1].split(';')[0])].get_name_gebaeude(), gebaeude_ausstehend[-1].split(';')[1])
		geld += gebaeude_array[index].get_kosten()
	
	
func get_geld():
	return geld

func set_geld(wert):
	geld = wert
	

func set_geld_com(wert):
	Console.add_command('set_geld', self, set_geld(0))\
		.set_description('Sets Geld')\
		.add_argument('geld', TYPE_INT)\
		.register()
		
func get_beliebtheit():
	return beliebtheit
	
func set_beliebtheit(wert):
	beliebtheit = wert
	
func set_beliebtheit_com(wert):
	Console.add_command('set_beliebtheit', self, set_beliebtheit(0.51))\
		.set_description('Sets Beliebtheit   Wert: 0<Beliebtheit<1')\
		.add_argument('beliebtheit', Console.FloatRangeType.new(0, 1.01, 0.01))\
		.register()

func get_bevoelkerung():
	return bevoelkerung
	
func set_bevoelkerung(wert):
	bevoelkerung = wert
	
func set_bevoelkerung_com(wert):
	Console.add_command('set_bevoelkerung', self, set_bevoelkerung(1000))\
		.set_description('Sets Bevölkerung   Wert: 0<Bevölkerung')\
		.add_argument('bevölkerung', TYPE_INT)\
		.register()
		
func get_level():
	return levelSpieler
	
func set_level2(wert):
	levelSpieler = wert
	
func set_level_com(wert):
	Console.add_command('set_level', self, set_level2(1))\
		.set_description('Sets Level   Wert: 0<Level<11')\
		.add_argument('level', TYPE_INT)\
		.register()

func set_level(): 
	if(bevoelkerung <= 850):
		levelSpieler = 1
	elif(bevoelkerung <= 1000):
		levelSpieler = 2
	elif(bevoelkerung <= 1250):
		levelSpieler = 3
	elif(bevoelkerung <= 1550):
		levelSpieler = 4
	elif(bevoelkerung <= 1800):
		levelSpieler = 5
	elif(bevoelkerung <= 2000):
		levelSpieler = 6
	elif(bevoelkerung <= 2500):
		levelSpieler = 7
	elif(bevoelkerung <= 3000):
		levelSpieler = 8
	elif(bevoelkerung <= 5000):
		levelSpieler = 9
	elif(bevoelkerung <= 20000):
		levelSpieler = 10
	else:
		levelSpieler = 11
#		(Final)

func save():
	var data = {
		"geld": geld,
		"bevoelkerung": bevoelkerung,
		"beliebtheit": beliebtheit,
		"gebaeude_gebaut": gebaeude_gebaut,
		"gebaeude_ausstehend": gebaeude_ausstehend,
		"level": levelSpieler,
		"zeit": zeit
	}
	
	var file = File.new()
	file.open("user://savegame.save", File.WRITE)
	file.store_line(to_json(data))
	print("Saved: ", data)
	file.close()
	
func load_game():
	var file = File.new()
	file.open("user://savegame.save", File.READ)
	var data = parse_json(file.get_line())
	geld = data["geld"]
	bevoelkerung = data["bevoelkerung"]
	beliebtheit = data["beliebtheit"]
	gebaeude_gebaut = data["gebaeude_gebaut"]
	gebaeude_ausstehend = data["gebaeude_ausstehend"]
	levelSpieler = data["level"]
	zeit = data["zeit"]
	print("Loaded: ", data)
	file.close()
