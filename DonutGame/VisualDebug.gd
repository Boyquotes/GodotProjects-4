extends Node

signal debugTextChanged
var debug_text: String = "text"

var p_time_start = 0
var p_time_now = 0

func _ready():
    p_time_start = OS.get_unix_time()
    set_process(true)

func get_Time () :
	return p_time_now - p_time_start

func set_debug_text(text_content):
	debug_text = text_content
	emit_signal("debugTextChanged")


func _process(delta):
    p_time_now = OS.get_unix_time()