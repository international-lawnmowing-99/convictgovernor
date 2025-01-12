extends Control
class_name FarmUI

@onready var convictList:ConvictListBuilding = $Panel/ConvictListPanel
@onready var assignConvictsPanel = $Panel/AssignConvictPanel
var farm:Farm
var dock:Dock
func _ready() -> void:
	dock = farm.get_tree().root.get_node("Map/Dock")

func _process(_delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func _on_exit_button_pressed() -> void:
	hide()


func _on_convicts_list_button_pressed() -> void:
	assignConvictsPanel.visible = false
	convictList.visible = !convictList.visible
	convictList.Populate(farm.convictEmployees)


func _on_assign_convicts_button_pressed() -> void:
	convictList.visible = false
	assignConvictsPanel.visible = !assignConvictsPanel.visible
	assignConvictsPanel.Populate(dock.government.convicts)
