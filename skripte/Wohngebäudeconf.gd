extends ConfirmationDialog


var text = "Nix gut diese"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_ok().text = "Ja"
	get_cancel().text = "Nein"
	self.rect_position = Vector2(1920/2-100,1080/2-100)


func _on_PopupMenu_id_pressed(id):
	if (id == 0):
		dialog_text = "Möchten sie Wolkenkratzer wirklich bauen?"
	if (id == 1):
		dialog_text = "Möchten sie Wohnkomplex wirklich bauen?"
	if (id == 2):
		dialog_text = "Möchten sie Mehrfamilienhaus wirklich bauen?"
	if (id == 3):
		dialog_text = "Möchten sie Einfamilienhaus wirklich bauen?"
	if (id == 4):
		dialog_text = "Möchten sie Grünanlage wirklich bauen?"
	if (id == 5):
		dialog_text = "Möchten sie Parkplatz wirklich bauen?"
	if (id == 6):
		dialog_text = "Möchten sie Sportanlage wirklich bauen?"
	if (id == 7):
		dialog_text = "Möchten sie Supermarkt wirklich bauen?"
	if (id == 8):
		dialog_text = "Möchten sie Restaurant wirklich bauen?"
	if (id == 9):
		dialog_text = "Möchten sie Theater wirklich bauen?"
	if (id == 10):
		dialog_text = "Möchten sie Busbahnhof wirklich bauen?"
	if (id == 11):
		dialog_text = "Möchten sie Parkhaus wirklich bauen?"
	if (id == 12):
		dialog_text = "Möchten sie Museum wirklich bauen?"
	if (id == 13):
		dialog_text = "Möchten sie Bank wirklich bauen?"
	if (id == 14):
		dialog_text = "Möchten sie Straßenbahn wirklich bauen?"
	if (id == 15):
		dialog_text = "Möchten sie Bürokomplex wirklich bauen?"
	if (id == 16):
		dialog_text = "Möchten sie Schwimmbad wirklich bauen?"
	if (id == 17):
		dialog_text = "Möchten sie Einkaufszentrum wirklich bauen?"
	if (id == 18):
		dialog_text = "Möchten sie Bierbrauerei wirklich bauen?"
	if (id == 19):
		dialog_text = "Möchten sie Bahnhof wirklich bauen?"
	if (id == 20):
		dialog_text = "Möchten sie Campus wirklich bauen?"
	if (id == 21):
		dialog_text = "Möchten sie U-Bahn wirklich bauen?"
	if (id == 22):
		dialog_text = "Möchten sie Autohaus wirklich bauen?"
	if (id == 23):
		dialog_text = "Möchten sie Gebetsteppichweberei wirklich bauen?"
	if (id == 24):
		dialog_text = "Möchten sie Freizeitpark wirklich bauen?"
	if (id == 25):
		dialog_text = "Möchten sie Industrieanlage wirklich bauen?"
	if (id == 26):
		dialog_text = "Möchten sie Flughafen wirklich bauen?"
	popup()
