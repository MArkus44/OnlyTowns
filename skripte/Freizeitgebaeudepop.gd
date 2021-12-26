extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Schwimmbad", 1, 0)
	add_item("Theater", 2, 0)
	add_item("Freizeitpark", 3, 0)
	add_item("Sportanlage", 4, 0)
	add_item("Museum", 5, 0)
	add_item("Campus", 6 ,0)
	self.rect_position = Vector2(1920/2-50,1080/2-50)
	
