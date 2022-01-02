extends Node2D

var b_config = "res://configs/Bauunternehmen.cfg"
var g_config = "res://configs/Gebaeude.cfg"
var e_config = "res://configs/Ereignisse.cfg"

var geld = 0
var beliebtheit = 0.54
var bevoelkerung = 1000
var levelSpieler = 1
var ereignis
var bauunternehmen

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
var gebaeude_anzahl = []
# var gebaeude_uebrig = []

var ereignisse_array = []
var bauunternehmen_array = []
const Bauunternehmen = preload("res://skripte/Bauunternehmen.gd")
const Gebaeude = preload("res://skripte/Gebaeude.gd")
const Ereignisse = preload("res://skripte/Ereignisse.gd")
# var antrag_tmp = Antrag.new()

var notification

func _ready():
	t_print("Running.")
	setup()
	load_game()
#	#connect("GebaeudeIndex",self,antrag_gebaeude(GebaeudeIndex))
	set_geld_com(0)
	set_beliebtheit_com(0.51)
	set_bevoelkerung_com(1000)
	set_level_com(2)
	
	for i in range(len(gebaeude_array) - 1):
		$Bildschirm/BildschirmBild/WindowBildschirm/GebauteGebaeude/WindowGebaeude/gebaut_pop.add_item(gebaeude_array[i].get_name_gebaeude(), i)

func setup():
	hinzufuegen()

func _process(delta):
	zeit += delta  # in Sekunden
	gebaeude_pop()
	set_level()
	geld_einfluss_gebaeude()
	neuer_regelmaessige_mitteilung()
	steuern()
	
	for i in gebaeude_ausstehend:
		if int(i.split(';')[1]) <= zeit:
			t_print(gebaeude_array[int(i.split(';')[0])].get_name_gebaeude())
			bevoelkerung += gebaeude_array[int(i.split(';')[0])].get_bevoelkerung_einfluss()
			beliebtheit += gebaeude_array[int(i.split(';')[0])].get_beliebtheit_einfluss()
			# t_print(typeof(gebaeude_array[int(i.split(';')[0])]))
			gebaeude_gebaut.append(gebaeude_array[int(i.split(';')[0])])
			gebaeude_ausstehend.remove(gebaeude_ausstehend.find(i))
			gebaeude_anzahl[int(i.split(';')[0])] += 1
			t_print(gebaeude_anzahl)
			t_print(beliebtheit)
	#t_print(geld)

func hinzufuegen():
	var config = ConfigFile.new()
	var err = config.load(b_config)
	var anzahl = config.get_value("Anzahl", "anzahl_unternehmen")
	if err == 0:
		for i in range(anzahl):
			var bauunternehmen = Bauunternehmen.new()
			var name_unternehmen = config.get_value(str(i + 1), "name_unternehmen")
			var beschreibung = config.get_value(str(i + 1), "beschreibung")
			var multiplikator_geld = config.get_value(str(i + 1), "multiplikator_geld")
			var multiplikator_bauzeit = config.get_value(str(i + 1), "multiplikator_bauzeit")
			bauunternehmen.set_name(name_unternehmen)
			bauunternehmen.set_beschreibung(beschreibung)
			bauunternehmen.set_multiplikator_geld(multiplikator_geld)
			bauunternehmen.set_multiplikator_bauzeit(multiplikator_bauzeit)
			bauunternehmen_array.append(name)
	
	config = ConfigFile.new()
	err = config.load(g_config)
	anzahl = config.get_value("Anzahl", "anzahl_gebaeude")
	for i in range(anzahl):
		gebaeude_anzahl.append(int(0))
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
			gebaeude.set_index(i)
			
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
				
	config = ConfigFile.new()
	err = config.load(e_config)
	anzahl = config.get_value("Anzahl", "anzahl_ereignisse")
	if err == 0:
		for i in range (anzahl):
			var ereignisse = Ereignisse.new()
			var name = config.get_value(str(i + 1), "name")
			var level = config.get_value(str(i + 1), "level")
			var dauer = config.get_value(str(i + 1), "dauer")
			var einkommen_einfluss = float(config.get_value(str(i + 1), "einkommen_einfluss"))
			var geld_einfluss = float(config.get_value(str(i+1), "geld_einfluss"))
			var bevoelkerung_einfluss = float(config.get_value(str(i + 1), "bevoelkerung_einfluss"))
			var beliebtheit_einfluss = float(config.get_value(str(i + 1), "beliebtheit_einfluss"))
			var kaputt = config.get_value(str(i + 1), "kaputt")
			var antraege_verzoegerung =(config.get_value(str(i + 1), "antraege_verzoegerung"))
			ereignisse.set_name_ereignis(name)
			ereignisse.set_level(level)
			ereignisse.set_dauer(dauer)
			ereignisse.set_einkommen_einfluss(einkommen_einfluss)
			ereignisse.set_geld_einfluss(geld_einfluss)
			ereignisse.set_bevoelkerung_einfluss(bevoelkerung_einfluss)
			ereignisse.set_beliebtheit_einfluss(beliebtheit_einfluss)
			ereignisse.set_kaputt(kaputt)
			ereignisse.set_antraege_verzoegerung(antraege_verzoegerung)
			ereignisse_array.append(ereignisse)

func geld_einfluss_gebaeude():
	if zeit >= tmp_zeit_gebauede + zeit_zwischen_gebauede:
		tmp_zeit_gebauede += zeit_zwischen_gebauede
		# t_print("Gebaeude.")
		for i in gebaeude_gebaut:
			geld += i.get_geld_einfluss()
			
func steuern():
	if zeit >= tmp_zeit_steuern + zeit_zwischen_steuern:
		# t_print("Steuern.")
		tmp_zeit_steuern += zeit_zwischen_steuern
		geld += 1000 * bevoelkerung * beliebtheit
			
func neuer_regelmaessige_mitteilung():
	if zeit >= tmp_zeit_mitteilungen + zeit_zwischen_mitteilungen:
		tmp_zeit_mitteilungen += zeit_zwischen_mitteilungen
	# mitteilungen_uebrig[0].anzeigen()
	
func antrag_gebaeude(index):
	t_print(gebaeude_array[index].get_name_gebaeude())
	return gebaeude_array[index].get_name_gebaeude()
	
func antrag_stellen(index):
	var rn = RandomNumberGenerator.new().randi_range(0, 100)
	if rn * beliebtheit > 40:
		gebaeude_ausstehend.append(str(index) + ';' + str((gebaeude_array[index].get_bauzeit()) + zeit))
		t_print(str(gebaeude_array[int(gebaeude_ausstehend[-1].split(';')[0])].get_name_gebaeude()) + " " + str(gebaeude_ausstehend[-1].split(';')[1]))
		geld += gebaeude_array[index].get_kosten()
	
	
func get_geld():
	return geld

func set_geld(wert):
	geld = wert
	

# warning-ignore:unused_argument
func set_geld_com(wert):
	Console.add_command('set_geld', self, set_geld(0))\
		.set_description('Sets Geld')\
		.add_argument('geld', TYPE_INT)\
		.register()

func get_beliebtheit():
	return beliebtheit
	
func set_beliebtheit(wert):
	beliebtheit = wert
	
# warning-ignore:unused_argument
func set_beliebtheit_com(wert):
	Console.add_command('set_beliebtheit', self, set_beliebtheit(0.51))\
		.set_description('Sets Beliebtheit   Wert: 0<Beliebtheit<1')\
		.add_argument('beliebtheit', Console.FloatRangeType.new(0, 1.01, 0.01))\
		.register()

func get_bevoelkerung():
	return bevoelkerung
	
func set_bevoelkerung(wert):
	bevoelkerung = wert
	
# warning-ignore:unused_argument
func set_bevoelkerung_com(wert):
	Console.add_command('set_bevoelkerung', self, set_bevoelkerung(1000))\
		.set_description('Sets Bevölkerung   Wert: 0<Bevölkerung')\
		.add_argument('bevölkerung', TYPE_INT)\
		.register()
		
func get_level():
	return levelSpieler
	
func set_level2(wert):
	levelSpieler = wert
	
# warning-ignore:unused_argument
func set_level_com(wert):
	Console.add_command('set_level', self, set_level2(1))\
		.set_description('Sets Level   Wert: 0<Level<11')\
		.add_argument('level', TYPE_INT)\
		.register()

func get_notification():
	return notification

func set_notification():
	if (notification == true):
		notification = false
	else:
		notification = true

func ereignis():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rn = rng.randi_range(0,28)
	ereignis = ereignisse_array[rn]
	if (get_level() >= ereignis.get_level()):
		t_print(rn)
		t_print(ereignis.get_name_ereignis())
	else: 
		t_print(str(get_level()) + "<" + str(ereignis.get_level()))
		t_print("Ereignis besitzt zu hohes Level.")
		ereignis()

func get_ereignis_name():
	return ereignis.get_name_ereignis()

func get_ereignis_level():
	return ereignis.get_level()

func get_ereignis_dauer():
	return ereignis.get_dauer()

func get_ereignis_einkommen_einfluss():
	return ereignis.get_einkommen_einfluss()

func get_ereignis_geld_einfluss():
	return ereignis.geld_einfluss

func get_ereignis_bevoelkerung_einfluss():
	return ereignis.bevoelkerung_einfluss

func get_ereignis_beliebtheit_einfluss():
	return ereignis.beliebtheit_einfluss

func get_ereignis_kaputt():
	return ereignis.kaputt

func get_ereignis_antraege_verzoegerung():
	return ereignis.antraege_verzoegerung

func get_name_bauunternehmen():
	return bauunternehmen.
	
func get_bauzeit():
	return bauunternehmen.bauzeit

func get_multiplikator_geld():
	return bauunternehmen.multiplikator_geld

func get_multiplikator_bauzeit():
	return bauunternehmen.multiplikator_bauzeit

func _exit_tree():
	Console.remove_command("set_geld")
	Console.remove_command("set_bevoelkerung")
	Console.remove_command("set_beliebtheit")
	Console.remove_command("set_level")
	
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

func gebaeude_pop():
	var pop = $Bildschirm/BildschirmBild/WindowBildschirm/GebauteGebaeude/WindowGebaeude/gebaut_pop
	for i in range(len(gebaeude_array) - 1):
		pop.set_item_text(i, "")
		pop.set_item_text(i, gebaeude_array[i].get_name_gebaeude())
	for i in range(len(gebaeude_anzahl) - 1):
		pop.set_item_text(i, pop.get_item_text(i) + ":   " + str(gebaeude_anzahl[i]))

func save():
	var gebaeude_save_g = []
	
	for i in gebaeude_gebaut:
		gebaeude_save_g.append(i.get_index())
	
	var data = {
		"geld": geld,
		"bevoelkerung": bevoelkerung,
		"beliebtheit": beliebtheit,
		"gebaeude_gebaut": gebaeude_save_g,
		"gebaeude_ausstehend": gebaeude_ausstehend,
		"gebaeude_anzahl": gebaeude_anzahl,
		"level": levelSpieler,
		"zeit": zeit
	}
	
	var file = File.new()
	file.open("user://savegame.save", File.WRITE)
	file.store_line(to_json(data))
	t_print("Saved: " + str(data))
	file.close()
	
func load_game():
	var file = File.new()
	file.open("user://savegame.save", File.READ)
	var data = parse_json(file.get_line())
	geld = data["geld"]
	bevoelkerung = data["bevoelkerung"]
	beliebtheit = data["beliebtheit"]
	var gebaeude_load_g = data["gebaeude_gebaut"]
	gebaeude_ausstehend = data["gebaeude_ausstehend"]
	gebaeude_anzahl = data["gebaeude_anzahl"]
	levelSpieler = data["level"]
	zeit = data["zeit"]
	
	for i in gebaeude_load_g:
		gebaeude_gebaut.append(gebaeude_array[i])
	
	t_print("Loaded: " + str(data))
	file.close()
	
func t_print(var wert):
	print(str(zeit) + ": >>>  " + str(wert))
