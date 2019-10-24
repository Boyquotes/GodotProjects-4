extends Area2D

var velocityLerpSpeed : float = 1000
var velocityDamper : float = 25
var maxSpeedDragged : float = 20000
var maxSpeedFree : float = 10000

var justPressed = false
var justReleased = false
var cursorInArea = false
var dragging = false

var dragOffset : Vector2
var speed : float
var velocity : Vector2

func _ready():
	set_process(true)

func _process(delta) :

	get_grabbing()

	if dragging :
		set_dragged_values(delta)	
	elif velocity.length_squared() > 0 :
		set_free_values(delta)
		
	check_and_set_position(delta)
	
	cursorInArea = false
	justPressed = false
	justReleased = false

func check_and_set_position(delta : float) :
	if position.x < 0 || position.x > get_viewport().size.x || position.y < 0 || position.y > get_viewport().size.y :
		position = get_viewport().size * 0.5
	position += velocity * delta	

func set_dragged_values(delta : float) :
	var intendedDirection = get_global_mouse_position() - position + dragOffset
	var velDifference = intendedDirection - velocity
	var goingFurther : bool = intendedDirection.dot(velocity) < 0
	
	var lrp : float
	if goingFurther :
		print("going further")
		lrp = velocityLerpSpeed * 4 * delta * intendedDirection.length()
	else:
		print("going towards")
		lrp = velocityLerpSpeed * delta * intendedDirection.length()
		
	speed += lrp
	
	if (speed > maxSpeedDragged):
		speed = maxSpeedDragged
	if (speed * delta > intendedDirection.length()) :
		speed = intendedDirection.length() / delta
	
	velocity = intendedDirection.normalized() * speed

func set_free_values(delta : float) :
	var lrp : float
	lrp = velocityLerpSpeed  * delta * velocityDamper
		
	speed -= lrp
	if speed < 0:
		speed = 0
	elif speed > maxSpeedFree :
		speed = maxSpeedFree
		
	velocity = velocity.normalized() * speed


func get_grabbing():
	if !dragging && cursorInArea && justPressed :
		dragging = true
	if justReleased :
		dragging = false
	
	return dragging


func _input(event):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
			dragOffset = position - get_viewport().get_mouse_position()
			justPressed = event.is_pressed()
			justReleased = !event.is_pressed()

func _on_Donut_input_event(viewport, event, shape_idx):
	cursorInArea = true
	pass # Replace with function body.
