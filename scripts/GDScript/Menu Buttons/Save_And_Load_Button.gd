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
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node(".").save_game()
	get_parent().get_node("Game_Has_Been_Saved_Info").visible = true
	print("Game has been saved")
	# Timer
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_parent().get_node("Game_Has_Been_Saved_Info").visible = false
	
