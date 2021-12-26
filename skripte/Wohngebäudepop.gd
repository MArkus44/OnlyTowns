extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Einfamilienhaus", 1, 0)
	add_item("Mehrfamilienhaus", 2, 0)
	add_item("Wohnkomplex",3,0)
	add_item("Wokkenkratzer",4,0)
	self.rect_position = Vector2(1920/2-50,1080/2-50)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
