extends Area3D
class_name Dock

var person = preload("res://person.tscn")
@onready var timer:Timer = $Timer
@export var map:Map
@export var workYard:WorkYard
@export var ui:UI
@export var shipList:ShipList

var government:Government = Government.new()


var calendar = Calendar.new()
var ladcount:int = 4

var foodStockpile:int = 0
var woodStockpile:int = 0

func _on_timer_timeout() -> void:
	calendar.GameDay()
	ui.UpdateTime(calendar)
	shipList.GameDay()
	if government.convicts.size() < 500:
		var newPerson:Person = person.instantiate()
		map.add_child(newPerson)
		government.convicts.append(newPerson)
		ui.UpdatePopulation(government)
		newPerson.position = position
		newPerson.speed = 1
		newPerson.map = map
		newPerson.moveTarget = workYard


	government.GameDay()
	ui.UpdateFood(government)


	timer.start(.25)
	ladcount += 1
	#print(str(ladcount) + " lads now")
