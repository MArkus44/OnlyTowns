extends HSlider

var mylabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	print("Helligkeit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mylabel=$Zahl
	mylabel.text = value as String

func _ChangingBrightnessByConfig(var Bright):
	value = Bright
