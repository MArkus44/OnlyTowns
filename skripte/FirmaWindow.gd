extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_name_bauunternehmen()
	var n1 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	var n2 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	while(n2 == n1):
		n2 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	var n3 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	while(n3 == n2 || n3 == n1):
		n3 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	var n4 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	while(n4 == n3 || n4 == n2 || n4 == n1):
		n4 = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().randomG()
	$Firma1.text = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_name_bauunternehmen(n1)
	$Firma2.text = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_name_bauunternehmen(n2)
	$Firma3.text = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_name_bauunternehmen(n3)
	$Firma4.text = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_name_bauunternehmen(n4)
