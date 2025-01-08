extends Control
class_name FarmUI

@onready var convictList:ConvictListBuilding = $Panel/ConvictListPanel
var farm:Farm
func _process(_delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func _on_exit_button_pressed() -> void:
	hide()


func _on_convicts_list_button_pressed() -> void:
	convictList.visible = !convictList.visible
	convictList.Populate(farm.convictEmployees)
