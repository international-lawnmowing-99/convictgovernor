extends Panel

class_name NewBuildingMenu



func _on_farm_button_pressed() -> void:
	if camera.building:
		print("we already have a farm")
		return
	print("making a new farm so we can buy it back some day")
	camera.isPlacingBuilding = true
	camera.building = farm.instantiate()
	var farmhouse = camera.building.get_child(0)
	farmhouse.material = farmhouse.material.duplicate()
	map.add_child(camera.building)
	dock.buildings.append(camera.building.get_script())
	buildingListPanel.Populate(dock.buildings)


func _on_house_button_pressed() -> void:
	if camera.building:
		print("we already have a farm")
		return
	print("making a new farm so we can buy it back some day")
	camera.isPlacingBuilding = true
	camera.building = farm.instantiate()
	var farmhouse = camera.building.get_child(0)
	farmhouse.material = farmhouse.material.duplicate()
	map.add_child(camera.building)
	dock.buildings.append(camera.building.get_script())
	buildingListPanel.Populate(dock.buildings)
