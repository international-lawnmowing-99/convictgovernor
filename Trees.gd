extends Node3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("People"):
		print("Lad went to forest")
		var lad = body as Person
		lad.moveTarget = lad.map.workYard
