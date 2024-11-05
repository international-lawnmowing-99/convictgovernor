extends Node3D
class_name WorkYard

var woodStockpile:int = 0
var shellStockpile:int = 0

func ReceiveRawGoods(rawGood:Good):
	if rawGood.goodName == "wood":
		woodStockpile+=1
	else:
		print("It wasn't wood")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("People"):
		#print("Lad went to work")
		var lad = body as Person
		lad.moveTarget = lad.map.trees
