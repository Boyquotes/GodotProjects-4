extends Container

export var useTimer : bool = true
export var morningVisibilityCurve : Curve
export var dayVisibilityCurve : Curve
export var eveningVisibilityCurve : Curve
export var nightVisibilityCurve : Curve

onready var timer = get_node("Timer")

var skymorning : Sprite
var skyday : Sprite
var skyevening : Sprite
var skynight : Sprite
var timeLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	if useTimer :
		set_process(false)
		timer.set_wait_time(0.01)
		timer.start()
	else :
		set_process(true)
	
	get_and_assign_vars()

func get_and_assign_vars() :
	for asd in get_children() :
		match asd.name :
			"morning" :
				skymorning = asd
			"day" :
				skyday = asd
			"evening" :
				skyevening = asd
			"night" :
				skynight = asd
			"timeLabel" :
				timeLabel = asd
				

func update_modulation():
	skymorning.modulate.a = morningVisibilityCurve.interpolate(DayTime.get_day_time_01())
	skyday.modulate.a = dayVisibilityCurve.interpolate(DayTime.get_day_time_01())
	skyevening.modulate.a = eveningVisibilityCurve.interpolate(DayTime.get_day_time_01())
	skynight.modulate.a = nightVisibilityCurve.interpolate(DayTime.get_day_time_01())
	timeLabel.set_time()

func _process(delta):
	update_modulation()
	
func _on_Timer_timeout():
	update_modulation()
