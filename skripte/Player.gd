extends Node2D

var b_config = "res://configs/Bauunternehmen.cfg"
var g_config = "res://configs/Gebaeude.cfg"
var e_config = "res://configs/Ereignisse.cfg"

var geld = 0
var beliebtheit = 0.51
var bevoelkerung = 1000

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

func setup():
	hinzufuegen()
	gebaeude_gebaut.append(gebaeude_array[0])

func _process(delta):
	zeit += delta  # in Sekunden
	geld_einfluss_gebaeude()
	neuer_regelmaessige_mitteilung()
	steuern()
	
	for i in range(len(gebaeude_ausstehend)):
		if int(gebaeude_ausstehend[i].split(';')[1]) <= zeit:
			print(gebaeude_array[int(gebaeude_ausstehend[i].split(';')[0])].get_name_gebaeude())
			bevoelkerung += gebaeude_array[int(gebaeude_ausstehend[i].split(';')[0])].get_bevoelkerung_einfluss()
			beliebtheit += gebaeude_array[int(gebaeude_ausstehend[i].split(';')[0])].get_beliebtheit_einfluss()
			gebaeude_gebaut.append(gebaeude_array[int(gebaeude_ausstehend[i].split(';')[0])])
			gebaeude_ausstehend.remove(i)
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
		for i in range(len(gebaeude_gebaut)):
			set_geld(get_geld() + gebaeude_gebaut[i].get_geld_einfluss())
			
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
	
func get_beliebtheit():
	return beliebtheit
	
func set_beliebtheit(wert):
	beliebtheit = wert
	
func get_bevoelkerung():
	return bevoelkerung
	
func set_bevoelkerung(wert):
	bevoelkerung = wert
	
func save():
	var data = {
		"geld": geld,
		"bevoelkerung": bevoelkerung,
		"beliebtheit": beliebtheit
	}
	
	var file = File.new()
	file.open("user://savegame.save", File.WRITE)
	file.store_line(to_json(data))
	
func load_game():
	var file = File.new()
	file.open("user://savegame.save", File.READ)
	var data = parse_json(file.get_line())
	print(data)
