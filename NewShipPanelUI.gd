extends Panel
class_name NewShipPanelUI

@onready var baseColour:ColorRect = $BaseColour
@onready var topColour:ColorRect = $TopColour
var shipList:ShipList

var unixArriveTime:int
var unixJourneyTime:int
var shipHullSize:int
var shipConvicts:int
var shipSettlers:int
var shipName:String

func NewDay(currentUnixTime:int):
	if currentUnixTime >= unixArriveTime:
		print("My ship came in (" + shipName + ")")
		shipList.incomingSipsList.erase(self)
		queue_free()
		return

	var percent:float = (unixArriveTime - currentUnixTime)/unixJourneyTime
	topColour.size.x = 300 * percent
