extends Panel
class_name BuildingList
var BuildingLine = preload("res://building_line.tscn")
@export var dock:Dock

func Populate(buildings:Array[Building]):
	for building:Building in buildings:
		var newLine = BuildingLine.instantiate()
		add_child(newLine)
