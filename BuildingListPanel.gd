extends Panel
class_name BuildingList
var BuildingLine = preload("res://building_line.tscn")
@export var dock:Dock
@onready var list = $"../ConvictListPanel/ScrollContainer/VBoxContainer"

func Populate(buildings:Array[Building]):
	for oldBuilding in list.get_children():
		oldBuilding.queue_free()
	for building:Building in buildings:
		var newLine = BuildingLine.instantiate()
		list.add_child(newLine)
