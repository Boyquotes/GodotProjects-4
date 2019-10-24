extends Area2D

var moving = false
onready var origScale = scale

func _process(delta):
	if moving :
		position = get_global_mouse_position()
		
		

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton :
		if event.is_pressed() :
			moving = true
		else :
			moving = false


func _on_Area2D_area_entered(area):
	print("Entered")
	scale = origScale * 2


func _on_Area2D_area_exited(area):
	print("EXIT")
	scale = origScale
