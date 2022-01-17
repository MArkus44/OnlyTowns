extends CheckBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (pressed):
		var label = $CheckboxText
		label.text="music on"
		$"/root/MusicScene"._spiele()
	else: 
		var label =$CheckboxText
		label.text="music off"
		$"/root/MusicScene"._anhalten()
