extends Control
class_name HouseUI

#@onready var list =

func _process(_delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func _on_exit_button_pressed() -> void:
	hide()
