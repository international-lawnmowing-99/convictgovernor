extends Panel
class_name BuildingList
var buildingLine = preload("res://building_line.tscn")
@export var dock:Dock
@onready var list = $ScrollContainer/VBoxContainer

func Populate(buildings:Array[Building]):
	for oldBuilding in list.get_children():
		oldBuilding.queue_free()
	for building:Building in buildings:
		var newLine = buildingLine.instantiate()
		list.add_child(newLine)
