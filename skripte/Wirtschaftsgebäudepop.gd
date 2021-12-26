extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Bank", 1, 0)
	add_item("Supermarkt", 2, 0)
	add_item("Industrieanlage", 3, 0)
	add_item("Einkaufszentrum", 4, 0)
	add_item("Bürokomplex", 5, 0)
	add_item("Marktplatz", 6 ,0)
	add_item("Autohaus", 7, 0)
	self.rect_position = Vector2(1920/2-100,1080/2-100)
	
