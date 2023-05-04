extends Node2D

var selected = false

func _ready():
	pass

func _process(delta):
	if selected:
		followMouse()
		
func followMouse():
	position = get_global_mouse_position()
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			#mouse down
			selected = true
		else:
			#mouse released
			selected = false
