extends CanvasLayer

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("esc_button"):
		get_tree().paused = !get_tree().paused
