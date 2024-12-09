extends Panel
class_name NewShipPanelUI

@onready var baseColour:ColorRect = $BaseColour
@onready var topColour:ColorRect = $TopColour
@onready var timeLabel:Label = $TimeLabel
@onready var shipNameLabel:Label = $ShipNameLabel
var shipList:ShipList

var unixArriveTime:int
var unixJourneyTime:int
var shipHullSize:int
var shipConvicts:int
var shipSettlers:int
var shipName:String

func GameDay(currentUnixTime:int):
	if currentUnixTime >= unixArriveTime:
		print("My ship came in (" + shipName + ")")
		shipList.incomingSipsList.erase(self)
		shipList.AddNewShip()
		queue_free()
		return

	var percent:float = (float)(unixArriveTime - currentUnixTime)/unixJourneyTime
	topColour.size.x = 300 *(1 - percent)

	shipNameLabel.text = shipName

	timeLabel.text = shipList.dock.calendar.GetTimeStringFromUnixTime(unixArriveTime)
