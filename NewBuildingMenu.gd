extends Panel

class_name NewBuildingMenu
@export var camera:CameraScript
var farm = preload("res://Farm.tscn")
var house = preload("res://House.tscn")
@export var map:Map
@export var dock:Dock
@export var buildingListPanel:BuildingList



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
		print("we already have a house")
		return
	print("making a new house")
	camera.isPlacingBuilding = true
	camera.building = house.instantiate()
	var roof = camera.building.get_child(0)
	roof.material = roof.material.duplicate()
	map.add_child(camera.building)
	dock.buildings.append(camera.building.get_script())
	buildingListPanel.Populate(dock.buildings)
