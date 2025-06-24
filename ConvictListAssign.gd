extends Panel
class_name ConvictListAssign
var convictLine = preload("res://ConvictAssignLine.tscn")
@export var dock:Dock
@onready var container = $ScrollContainer/VBoxContainer
var building

func _ready() -> void:
	if !building:
		print("uh oh")

func Populate(allConvicts:Array[Convict]):
	for line in container.get_children():
		line.queue_free()
	for lad:Person in allConvicts:
		var newLine = convictLine.instantiate()
		container.add_child(newLine)
		newLine.convict = lad
		var button = newLine.get_child(1)
		button.pressed.connect(Assign(lad, building))

func Assign(lad:Convict, _building):
	var workplace = _building as Building
