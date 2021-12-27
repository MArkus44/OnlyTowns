extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_close_button().visible = false
	self.rect_position = Vector2(520,180)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
