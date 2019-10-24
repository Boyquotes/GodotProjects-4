extends Label

func set_time() :
	var h = String(DayTime.get_hours())
	var m = String(DayTime.get_minutes())
	if m.length() < 2 :
		m = "0" + m
		
	text = h + ":" + m

