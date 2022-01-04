extends WindowDialog

var wait = 0
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
	
func text():
	var n1 = player.randomG()
	var n2 = player.randomG()
	while(n2 == n1):
		n2 = player.randomG()
	var n3 = player.randomG()
	while(n3 == n2 || n3 == n1):
		n3 = player.randomG()
	var n4 = player.randomG()
	while(n4 == n3 || n4 == n2 || n4 == n1):
		n4 = player.randomG()
	$Firma1.text = player.get_name_bauunternehmen(n1)
	$Firma1Beschreibung.text = player.get_beschreibung(n1)
	$Firma1Attribute.text = str(abs(float(player.get_kosten(n1)) * float(player.get_multiplikator_geld(n1)))) + " € " + str(float(player.get_bauzeit(n1)) * float(player.get_multiplikator_bauzeit(n1))) + " Monate"
	$Firma2.text = player.get_name_bauunternehmen(n2)
	$Firma2Beschreibung.text = player.get_beschreibung(n2)
	$Firma2Attribute.text = str(abs(float(player.get_kosten(n2)) * float(player.get_multiplikator_geld(n2)))) + " € " + str(float(player.get_bauzeit(n2)) * float(player.get_multiplikator_bauzeit(n2))) + " Monate"
	$Firma3.text = player.get_name_bauunternehmen(n3)
	$Firma3Beschreibung.text = player.get_beschreibung(n3)
	$Firma3Attribute.text = str(abs(float(player.get_kosten(n3)) * float(player.get_multiplikator_geld(n3)))) + " € " + str(float(player.get_bauzeit(n3)) * float(player.get_multiplikator_bauzeit(n3))) + " Monate"
	$Firma4.text = player.get_name_bauunternehmen(n4)
	$Firma4Beschreibung.text = player.get_beschreibung(n4)
	$Firma4Attribute.text = str(abs(float(player.get_kosten(n4)) * float(player.get_multiplikator_geld(n4)))) + " € " + str(float(player.get_bauzeit(n4)) * float(player.get_multiplikator_bauzeit(n4))) + " Monate"
	print(float(player.get_kosten(n1)))
	print(float(player.get_multiplikator_geld(n1)))
	print(float(player.get_bauzeit(n1)))
	print(float(player.get_multiplikator_bauzeit(n1)))
