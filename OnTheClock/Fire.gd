extends Node2D

var firePs : CPUParticles2D
var smokePs : CPUParticles2D

var origFireScale : Vector2
var origSmokeScale : Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	firePs = get_node("fire")
	origFireScale = firePs.scale
	
	smokePs = get_node("smoke")
	origSmokeScale = smokePs.scale
	pass # Replace with function body.


func _process(delta):
	var multiplier = DayTime.get_day_time_01()
	if multiplier > 0.5 :
		multiplier = 1 - multiplier
	multiplier *= 2
	
	firePs.scale = origFireScale * multiplier
	smokePs.scale = origSmokeScale * multiplier
	pass
