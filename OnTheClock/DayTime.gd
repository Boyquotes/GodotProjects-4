extends Node

export var useOwnTime : bool = true
export var minutes : float = 500
export var incrementSpeed : float = 100

func _process(delta):
	if incrementSpeed > 0 :
		minutes += incrementSpeed * delta
	if minutes > 24*60 :
		minutes -= 24*60

func get_hours() -> int:
	
	if useOwnTime :
		var h = 0
		var m = minutes
		while m > 59 :
			h += 1
			m -= 60
		return h
	else :
		return OS.get_time()["hour"]

func get_minutes() -> int:
	if useOwnTime :
		return int(minutes) % 60
	else :
		return OS.get_time()["minute"]
	
func get_day_elapsed_minutes() -> int:
	if useOwnTime :
		return int(minutes)
	else :
		var output = OS.get_time()["hour"] * 60
		output += OS.get_time()["minute"]
		return output

func get_day_time_01() -> float:
	var m_in_day : float = 24 * 60
	var output : float = get_day_elapsed_minutes() / m_in_day
	return output
	
func toggle_Time() :
	if !useOwnTime :
		minutes = get_day_elapsed_minutes()
		
	useOwnTime = !useOwnTime
	