extends Camera3D
class_name CameraScript
@export var scrollSpeed = 5

const RAY_LENGTH = 1000
var isPlacingBuilding:bool = false
var building:StaticBody3D
var farmUI = preload("res://farm_ui.tscn")
@export var ui:UI

var openUI:Array[Control] = []

func _process(delta: float) -> void:
	var moveVector:Vector2
	if Input.is_action_pressed("MoveLeft"):
		moveVector.x -= 1
	if Input.is_action_pressed("MoveRight"):
		moveVector.x += 1
	if Input.is_action_pressed("MoveUp"):
		moveVector.y -= 1
	if Input.is_action_pressed("MoveDown"):
		moveVector.y += 1

	moveVector = moveVector.normalized()
	position += Vector3(moveVector.x, 0, moveVector.y) * delta * scrollSpeed


func _physics_process(_delta):
	var space_state = get_world_3d().direct_space_state
	var cam:Camera3D = self
	var mousepos = get_viewport().get_mouse_position()

	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH

	if isPlacingBuilding:
		var groundQuery = PhysicsRayQueryParameters3D.create(origin, end, 0b0010)
		groundQuery.collide_with_areas = true
		var groundResult = space_state.intersect_ray(groundQuery)

		if groundResult:
			building.position = groundResult.position
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				print ("We'll leave it here!")
				isPlacingBuilding = false
				building = null
	else:
		var buildingQuery = PhysicsRayQueryParameters3D.create(origin, end, 0b0100)
		#buildingQuery.collide_with_areas = true
		var buildingResult = space_state.intersect_ray(buildingQuery)

		var debugBuilding:StaticBody3D
		if buildingResult:
			if !isPlacingBuilding:
				debugBuilding = buildingResult["collider"]
				debugBuilding.get_child(0).material.albedo_color = Color.from_hsv(randf(), .333, randf())
				if Input.is_action_just_pressed("left_mouse"):
					print("Clicked " + buildingResult["collider"].name)
					var newUI:FarmUI = farmUI.instantiate()
					ui.add_child(newUI)
					openUI.append(newUI)
					newUI.set_position(mousepos)


				#print("Yay, building " + buildingResult["collider"].name)
		else:
			if debugBuilding:
				debugBuilding.material.albedo_color = Color.GREEN
				debugBuilding = null
			#if debugBuilding:
				#debugBuilding.get_child(0).material.albedo_color = Color.GREEN
				#
