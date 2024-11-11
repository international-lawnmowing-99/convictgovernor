extends ColorRect
class_name UI

@onready var totalPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/TotalHBoxContainer/TotalPopulationLabel
@onready var convictPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/ConvictHBoxContainer2/ConvictPopulationLabel
@onready var freeSettlerPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/FreeHBoxContainer3/FreeSettlerPopulationLabel
@onready var soldierPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/HBoxContainer4/SoldierPopulationLabel
@onready var foodLabel:Label = $HBoxContainer/FoodControl/HBoxContainer/FoodLabel
@onready var timeLabel:Label = $HBoxContainer/TimeControl/HBoxContainer/TimeLabel

@export var camera:Camera3D
@export var map:Map
@onready var farm = preload("res://Farm.tscn")


func UpdateAll(government:Government):
	UpdatePopulation(government)
	UpdateFood(government)

func UpdatePopulation(government:Government):
	totalPopLabel.text = str(government.convicts.size())
	convictPopLabel.text = str(government.convicts.size())


func UpdateFood(government:Government):
	foodLabel.text = str(government.food)

func UpdateTime(calendar:Calendar):
	var timeDict = Time.get_date_dict_from_unix_time(calendar.unixDate)
	var weekdayString:String = ""

	match timeDict["weekday"]:
		Time.WEEKDAY_SUNDAY:
			weekdayString = "Sunday"
		Time.WEEKDAY_MONDAY:
			weekdayString = "Monday"
		Time.WEEKDAY_TUESDAY:
			weekdayString = "Tuesday"
		Time.WEEKDAY_WEDNESDAY:
			weekdayString = "Wednesday"
		Time.WEEKDAY_THURSDAY:
			weekdayString = "Thursday"
		Time.WEEKDAY_FRIDAY:
			weekdayString = "Friday"
		Time.WEEKDAY_SATURDAY:
			weekdayString = "Saturday"

	var monthString:String = ""

	match timeDict["month"]:
		Time.MONTH_JANUARY:
			monthString = "January"
		Time.MONTH_FEBRUARY:
			monthString = "Feburary"
		Time.MONTH_MARCH:
			monthString = "March"
		Time.MONTH_APRIL:
			monthString = "April"
		Time.MONTH_MAY:
			monthString = "May"
		Time.MONTH_JUNE:
			monthString = "June"
		Time.MONTH_JULY:
			monthString = "July"
		Time.MONTH_AUGUST:
			monthString = "August"
		Time.MONTH_SEPTEMBER:
			monthString = "September"
		Time.MONTH_OCTOBER:
			monthString = "October"
		Time.MONTH_NOVEMBER:
			monthString = "November"
		Time.MONTH_DECEMBER:
			monthString = "December"

	timeLabel.text = weekdayString + " " + str(timeDict["day"]) + ", " + monthString + ', ' + str(timeDict["year"])


func _process(_delta: float) -> void:
	#UpdateAll()pass
	pass


func _on_new_building_button_pressed() -> void:
	if camera.building:
		print("we already have a farm")
		return
	print("making a new farm so we can buy it back some day")
	camera.isPlacingBuilding = true
	camera.building = farm.instantiate()
	map.add_child(camera.building)

	pass # Replace with function body.
