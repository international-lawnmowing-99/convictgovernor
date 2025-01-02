extends ColorRect
class_name UI

@onready var totalPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/TotalHBoxContainer/TotalPopulationLabel
@onready var convictPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/ConvictHBoxContainer2/ConvictPopulationLabel
@onready var freeSettlerPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/FreeHBoxContainer3/FreeSettlerPopulationLabel
@onready var soldierPopLabel:Label = $HBoxContainer/PopulationControl/VBoxContainer/HBoxContainer4/SoldierPopulationLabel
@onready var foodLabel:Label = $HBoxContainer/FoodControl/HBoxContainer/FoodLabel
@onready var timeLabel:Label = $HBoxContainer/TimeControl/HBoxContainer/TimeLabel
@onready var newBuildingMenu = $BottomUIBar/NewBuildingPanel
var tempBuilding:Building

@export var camera:CameraScript
@export var map:Map
@onready var farm = preload("res://Farm.tscn")
@export var dock:Dock
@export var buildingListPanel:BuildingList
@export var convictListPanel:ConvictList

func UpdateAll(government:Government):
	UpdatePopulation(government)
	UpdateFood(government)

func UpdatePopulation(government:Government):
	totalPopLabel.text = str(government.convicts.size())
	convictPopLabel.text = str(government.convicts.size())
	convictListPanel.Populate(government.convicts)


func UpdateFood(government:Government):
	foodLabel.text = str(government.food)

func UpdateTime(calendar:Calendar):
	timeLabel.text = calendar.GetTimeString()

func _process(_delta: float) -> void:
	#UpdateAll()pass
	pass


func _on_new_building_button_pressed() -> void:
	newBuildingMenu.visible = !newBuildingMenu.visible



func _on_building_list_button_pressed() -> void:
	buildingListPanel.visible = !buildingListPanel.visible


func _on_convict_list_button_pressed() -> void:
	convictListPanel.visible = !convictListPanel.visible
