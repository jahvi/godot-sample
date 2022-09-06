extends KinematicBody2D

export var MAX_SPEED := 250

onready var navigation_agent := $NavigationAgent2D

var velocity := Vector2()

const MOVE_ANGLE := 10.0

func _ready():
	set_target_location(position)
	
func set_target_location(target: Vector2) -> void:
	navigation_agent.set_target_location(target)

func _physics_process(_delta):
	if navigation_agent.is_navigation_finished():
		return
	
	var move_direction = position.direction_to(navigation_agent.get_next_location())
	velocity = move_direction * MAX_SPEED
	navigation_agent.set_velocity(velocity)

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = move_and_slide(safe_velocity)
