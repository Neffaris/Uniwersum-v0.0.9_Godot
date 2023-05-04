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
	get_parent().get_node("Title").visible = false
	get_parent().get_node("Exit_Button_2").visible = false
	get_parent().get_node("Back_To_Main_Menu_Button_3").visible = false
	get_parent().get_node("Back_To_Main_Menu_Button_4").visible = true
	get_parent().get_node("Back_Or_Exit_Question_2").visible = false
	get_parent().get_node("Options_Button").visible = false
	get_parent().get_node("New_Game_Button").visible = false
	get_parent().get_node("Load_Game_Button").visible = false
	get_parent().get_node("Exit_Button").visible = false
	get_parent().get_node("Options_Text").visible = true
	get_parent().get_node("Fullscreen_Control/Fullscreen_Check_Switch").visible = true
	get_parent().get_node("Fullscreen_Control/Fullscreen_Check_Text").visible = true
