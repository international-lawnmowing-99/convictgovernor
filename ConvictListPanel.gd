extends Panel
class_name ConvictList
var convictLine = preload("res://convict_line.tscn")
@export var dock:Dock
@onready var container = $ScrollContainer/VBoxContainer

func Populate(allConvicts:Array[Person]):
	for line in container.get_children():
		line.queue_free()
	for lad:Person in allConvicts:
		var newLine = convictLine.instantiate()
		container.add_child(newLine)
