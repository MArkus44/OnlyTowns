extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.rect_position = Vector2(1920/2-100,1080/2-100)
	add_item("test",1,0)