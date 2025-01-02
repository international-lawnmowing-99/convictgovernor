extends Node3D
class_name LandGrid

var acreGrid:Array
var meshGrid:Array

var width:int = 30
var height:int = 30

var debugMesh:PackedScene = preload("res://plain_plane.tscn")

func _ready() -> void:
	for i in range(width):
		var column:Array[Acre] = []
		for j in range(height):
			var acre = Acre.new()
			column.append(acre)

			var marker:CSGMesh3D = debugMesh.instantiate()
			marker.position.x = i - width/2
			marker.position.z = j - height/2
			marker.position.y += 0.01
			marker.material = marker.material.duplicate()
			marker.material.albedo_color = Color.from_hsv(randf(), 1, randf())
			add_child(marker)
		acreGrid.append(column)
