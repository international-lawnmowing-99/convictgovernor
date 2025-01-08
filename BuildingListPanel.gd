extends Panel
class_name BuildingList
var buildingLine = preload("res://building_line.tscn")
@export var dock:Dock
@onready var list = $ScrollContainer/VBoxContainer

func Populate(buildings:Array):
	for oldBuilding in list.get_children():
		oldBuilding.queue_free()
	for building:Building in buildings as Array[Building]:
		var newLine = buildingLine.instantiate()
		list.add_child(newLine)
