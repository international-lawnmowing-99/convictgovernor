extends Area3D

var person = preload("res://person.tscn")
@onready var timer:Timer = $Timer
@export var map:Map
@export var workYard:WorkYard
@export var ui:UI
var government:Government = Government.new()

var calendar = Calendar.new()
var ladcount:int = 4

var foodStockpile:int = 0
var woodStockpile:int = 0

func _on_timer_timeout() -> void:
	calendar.GameDay()
	ui.UpdateTime(calendar)
	var newPerson:Person = person.instantiate()
	map.add_child(newPerson)
	government.convicts.append(newPerson)
	ui.UpdatePopulation(government)
	newPerson.position = position
	newPerson.speed = 1
	newPerson.map = map
	newPerson.moveTarget = workYard
	timer.start(.25)
	ladcount += 1
	print(str(ladcount) + " lads now")
	pass # Replace with function body.
