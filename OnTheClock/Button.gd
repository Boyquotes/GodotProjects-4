extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("button_up", self, "toggle_time")
	

func toggle_time() :
	DayTime.toggle_Time()
