extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	var wohn = get_parent()
	#var wohnanchor = wohn.
#	var wohnpos = wohn.get_position()
	#print(wohnanchor)
#	print(wohnpos)
	var pos = get_position()
	var rel = self.get_canvas_transform()
	print(rel)
	print(pos)
	#self.anchor_left = 100
	#self.anchor_right = 100
	#self.anchor_top = 100
	#self.anchor_bottom = 100
	add_item("drgw4g", 1, 0)
	add_item("fxghrh", 2, 0)
	self.rect_position = Vector2(1920/2-50,1080/2-50)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
