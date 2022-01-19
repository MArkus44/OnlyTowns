extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _toggle_lamp(button_pressed):
	if button_pressed:
		texture = load("res://assets/Tisch/LampeAn.png")
	else:
		texture = load("res://assets/Tisch/LampeAus.png")
