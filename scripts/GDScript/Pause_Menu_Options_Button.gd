extends Button

export(bool) var start_focused = false

func _ready():
	if(start_focused):
		grab_focus()

	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	
	get_parent().get_node("Pause_Menu_Options_Button").visible = false
	get_parent().get_node("Save_And_Load_Button").visible = false
	get_parent().get_node("Back_To_Menu_Button").visible = false
	get_parent().get_node("Back_To_Game_Button").visible = false
	get_parent().get_node("Back_To_Menu_Button_2").visible = false
	get_parent().get_node("Exit_To_Main_Menu_Button").visible = false
	get_parent().get_node("Exit_To_Desktop_Button").visible = false
	get_parent().get_node("Exit_To_Desktop_Button_2").visible = false
	get_parent().get_node("Paused_Info").visible = false
	#
	get_parent().get_node("Fullscreen_Control/Fullscreen_Check_Switch").visible = true
	get_parent().get_node("Fullscreen_Control/Fullscreen_Check_Text").visible = true
	get_parent().get_node("Options_Text").visible = true
	get_parent().get_node("Back_To_Pause_Menu").visible = true
