extends Node2D

onready var player := $Player

func _input(event):
   if event is InputEventMouseButton and event.pressed:
	   var target_location = get_global_mouse_position()
	   player.set_target_location(target_location)
