extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	VisualDebug.connect("debugTextChanged", self, "debug_text_changed")
	pass # Replace with function body.

func debug_text_changed () :
	self.text = VisualDebug.debug_text
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
