extends Node2D

var load_saved_game = false

func _ready():
	var file = File.new()
	if load_saved_game and file.file_exists("user://saved_game.json"):
		file.open("user://saved_game.json", File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		
		$Walls/YSort/Player.from_dictionary(data.player)
		$Walls/YSort/Player/Menu_And_HUD/HP_Bar.visible = false
		$Walls/YSort/Purple_Troll/Player_Detector/E_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Save_And_Load_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Pause_Menu_Options_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Paused_Info.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Fullscreen_Control/Fullscreen_Check_Switch.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Fullscreen_Control/Fullscreen_Check_Text.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Pause_Menu.visible = false
		#
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Menu_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_Or_Exit_Question.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Menu_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Options_Text.visible = false
		#
		$Walls/YSort/Player/Menu_And_HUD/Game_Has_Been_Saved_Info.visible = false
		Music_Controller.play_music()
	else:
		$Walls/YSort/Player/Menu_And_HUD/HP_Bar.visible = false
		$Walls/YSort/Purple_Troll/Player_Detector/E_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Save_And_Load_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Pause_Menu_Options_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Paused_Info.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Options_Text.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Fullscreen_Control/Fullscreen_Check_Switch.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Fullscreen_Control/Fullscreen_Check_Text.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Pause_Menu.visible = false
		#
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Menu_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_Or_Exit_Question.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Back_To_Menu_Button.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button_2.visible = false
		$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = false
		#
		$Walls/YSort/Player/Menu_And_HUD/Game_Has_Been_Saved_Info.visible = false
		Music_Controller.play_music()
		
func _input(event):
	if event.is_action_pressed("esc_button") and Global_Variables.dialogic_is_now_running == false:
		get_tree().paused = !get_tree().paused
		if $Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.visible == false:
			$Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.grab_focus()
			$Walls/YSort/Player/Menu_And_HUD/Location_Name.visible = false
			$Walls/YSort/Player/Menu_And_HUD/HP_Bar.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = false
			$Walls/YSort/Purple_Troll/Player_Detector/E_Button.visible = false
			#
			$Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.visible = true
			$Walls/YSort/Player/Menu_And_HUD/Save_And_Load_Button.visible = true
			$Walls/YSort/Player/Menu_And_HUD/Pause_Menu_Options_Button.visible = true
			$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button.visible = true
			$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button.visible = true
			$Walls/YSort/Player/Menu_And_HUD/Paused_Info.visible = true
			print("Pause game menu has been opened")
			print("Game is paused")
		else:
			$Walls/YSort/Player/Menu_And_HUD/Back_To_Game_Button.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Save_And_Load_Button.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Settings_Button.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Exit_To_Main_Menu_Button.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Exit_To_Desktop_Button.visible = false
			$Walls/YSort/Player/Menu_And_HUD/Paused_Info.visible = false
			print("Pause game menu has been closed")
	if event.is_action_pressed("esc_button") and Global_Variables.dialogic_is_now_running == true:
		print("Dialogic is now running. You can't open menu right now.")
	# Ekwipunek
	if event.is_action_pressed("inventory_key"):
		if Global_Variables.dialogic_is_now_running == true:
			print("Dialogic is now running. You can't open Inventory right now.")
		else:
			if $Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible == false:
				$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = true
				$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = false
				print("Inventory has been opened")
			else:
				$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = false
				print("Inventory has been closed")
	# Ekran pomocy
	if event.is_action_pressed("help_key"):
		if Global_Variables.dialogic_is_now_running == true:
			print("Dialogic is now running. You can't open Help menu right now.")
		else:
			if $Walls/YSort/Player/Menu_And_HUD/Help_Info.visible == false:
					$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = true
					$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = true
					print("Help menu has been opened")
			else:
				$Walls/YSort/Player/Menu_And_HUD/Inventory_Panel.visible = false
				$Walls/YSort/Player/Menu_And_HUD/Help_Info.visible = false
				print("Help menu has been closed")
# Zapisywanie gry
func save_game():
	var data = {
		"player" : $Walls/YSort/Player.to_dictionary(),
#		"skeletons" : $SkeletonSpawner.to_dictionary(),
#		"potion1" : is_instance_valid(get_node("/root/Root/StartPotion1")),
#		"potion2" : is_instance_valid(get_node("/root/Root/StartPotion2"))
	}
	
	var file = File.new()
	file.open("user://saved_game.json", File.WRITE)
	var json = to_json(data)
	file.store_line(json)
	file.close()
