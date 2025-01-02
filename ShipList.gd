extends Control
class_name ShipList
var newShipPanelUI = preload("res://NewShipPanelUI.tscn")

var incomingSipsList:Array
@export var dock:Dock
var calendar:Calendar
var count:int = 0

func GameDay():
	for ship:NewShipPanelUI in incomingSipsList:
		ship.GameDay(dock.calendar.unixDate)


func _ready() -> void:
	calendar = dock.calendar
	AddNewShip()

func AddNewShip():
	var newShip:NewShipPanelUI = newShipPanelUI.instantiate()
	newShip.shipList = self
	newShip.shipConvicts = randi()%10 * 10
	newShip.shipSettlers = randi()%40

	newShip.unixJourneyTime = randi_range(180, 270) * 62400
	newShip.unixArriveTime = calendar.unixDate + newShip.unixJourneyTime

	count += 1
	newShip.shipName = "New Ship " + str(count)
	incomingSipsList.append(newShip)
	add_child(newShip)
