extends CharacterBody3D
class_name Person
@export var speed:float
@export var moveTarget:Node3D
@export var map:Map

var house:House
var workplace:Building

func _process(delta: float) -> void:
	if !moveTarget:
		return

	position += (-position + moveTarget.position).normalized() * delta * speed
