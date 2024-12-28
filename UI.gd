extends ColorRect
class_name UI

@onready var totalPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/TotalHBoxContainer/TotalPopulationLabel
@onready var convictPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/ConvictHBoxContainer2/ConvictPopulationLabel
@onready var freeSettlerPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/FreeHBoxContainer3/FreeSettlerPopulationLabel
@onready var soldierPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/HBoxContainer4/SoldierPopulationLabel
@onready var foodLabel:Label = $HBoxContainer/FoodControl/HBoxContainer/FoodLabel
@onready var timeLabel:Label = $HBoxContainer/TimeControl/HBoxContainer/TimeLabel

var tempBuilding:Building

@export var camera:CameraScript
@export var map:Map
@onready var farm = preload("res://Farm.tscn")
@export var dock:Dock
@export var buildingListPanel:BuildingList

func UpdateAll(government:Government):
	UpdatePopulation(government)
	UpdateFood(government)

func UpdatePopulation(government:Government):
	totalPopLabel.text = str(government.convicts.size())
	convictPopLabel.text = str(government.convicts.size())


func UpdateFood(government:Government):
	foodLabel.text = str(government.food)

func UpdateTime(calendar:Calendar):
	timeLabel.text = calendar.GetTimeString()

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
	var house = camera.building.get_child(0)
	house.material = house.material.duplicate()
	map.add_child(camera.building)
	dock.buildings.append(camera.building.get_script())
	buildingListPanel.Populate(dock.buildings)
	pass # Replace with function body.
