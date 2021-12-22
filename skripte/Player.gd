extends Node2D

var b_config = "res://configs/Bauunternehmen.cfg"
var g_config = "res://configs/Gebaeude.cfg"
var e_config = "res://configs/Ereignisse.cfg"

var geld = 0
var beliebtheit = 1
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
var gebaeude_tmp = Gebaeude.new()

func _ready():
	print("Running.")
	setup()
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
		if gebaeude_ausstehend[i].split(';')[1] == zeit:
			bevoelkerung += gebaeude_array[gebaeude_ausstehend[i]].get_bevoelkerung_einfluss()
			gebaeude_gebaut.append(gebaeude_array[gebaeude_ausstehend[i].split(';')[0]])
			gebaeude_ausstehend.remove(i)
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
			var typ = config.get_value(str(i + 1), "typ")
			gebaeude.set_name_gebaeude(name)
			gebaeude.set_kosten(int(kosten))
			gebaeude.set_geld_einfluss(int(geld_einfluss))
			gebaeude.set_beliebtheit_einfluss(int(beliebtheit_einfluss))
			gebaeude.set_bevoelkerung_einfluss(int(bevoelkerung_einfluss))
			gebaeude.set_level(int(level))
			gebaeude.set_bauzeit(int(bauzeit))
			gebaeude.set_spezifischer_faktor(int(spezifischer_faktor))
			gebaeude.set_typ(int(typ))
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
	gebaeude_tmp = index
	print(gebaeude_tmp)
	
func antrag_stellen():
	var rn = RandomNumberGenerator.new().randi_range(0, 100)
	if rn * beliebtheit > 40:
		gebaeude_ausstehend.append(str(gebaeude_tmp) + ';' + (gebaeude_array[gebaeude_tmp].get_bauzeit()) + zeit)
		geld -= gebaeude_array[gebaeude_tmp].get_kosten()
	
	
func get_geld():
	return geld

func set_geld(wert):
	geld = wert
	
func save():
	var data = {
		"geld": geld,
		"bevoelkerung": bevoelkerung,
		"beliebtheit": beliebtheit
	}
	
	var file = File.new()
	file.open("user://savegame.save", File.WRITE)
	file.store_line(to_json(data))
