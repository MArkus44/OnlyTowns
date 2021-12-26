extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Bahnhof", 1, 0)
	add_item("Busbahnhof", 2, 0)
	add_item("Flughafen", 3, 0)
	add_item("U-Bahn", 4, 0)
	add_item("Straßenbahn", 5, 0)
	add_item("Parkhaus", 6 ,0)
	add_item("Parkplatz", 7, 0)
	self.rect_position = Vector2(1920/2-50,1080/2-50)
