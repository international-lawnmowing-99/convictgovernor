extends Node2D

@onready var confirmButton:Button = $Panel/HBoxContainer/ConfirmButton
@onready var cancelButton:Button = $Panel/HBoxContainer/CancelButton

@onready var text = $Panel/Text

var requestingScript



func _on_confirm_button_pressed() -> void:
	#maybe just cunnect this at runtime when the confirm is spawned
	pass # Replace with function body.


func _on_cancel_button_pressed() -> void:
	pass # Replace with function body.
