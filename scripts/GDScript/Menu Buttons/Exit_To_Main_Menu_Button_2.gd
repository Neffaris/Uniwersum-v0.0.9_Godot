extends Button

export(bool) var start_focused = false

func _ready():
	if(start_focused):
		grab_focus()

	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()

func _on_Button_Pressed():
	get_parent().get_node("/root/Test_Dungeon").queue_free()
	Music_Controller.stop_music()
	get_tree().change_scene("res://scenes/Main_Menu_Screen.tscn")
	get_tree().paused = false
