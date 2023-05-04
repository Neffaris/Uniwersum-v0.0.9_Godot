extends KinematicBody2D

var player_is_in_area = false
#var dialogic_is_now_running = false

func _input(event):
	if event.is_action_pressed("action_key") and player_is_in_area == true:
		get_parent().get_node("Player/Menu_And_HUD/HP_Bar").visible = false
		get_parent().get_node("Purple_Troll/Player_Detector/E_Button").visible = false
		get_parent().get_node("Player/Menu_And_HUD/Help_Info").visible = false
		get_parent().get_node("Player/Menu_And_HUD/Inventory_Panel").visible = false
		dialogic_start()
		turn_off_the_player()
		#find_and_use_dialogue()
		
#func find_and_use_dialogue():
	#var dialogue_player = get_node_or_null("Purple_Troll_Dialogue_Player")

	#if dialogue_player:
		#dialogue_player.play()
func dialogic_start():
	if Global_Variables.dialogic_is_now_running == false:
		Global_Variables.dialogic_is_now_running = true
		var new_dialog = Dialogic.start('Nieznajomy_1_Statek_Wiezienny')
		add_child(new_dialog)
		new_dialog.connect("timeline_end", self, 'after_dialog')
	if Global_Variables.dialogic_is_now_running == true:
		print("One dialogic is now running")
		
func after_dialog(Nieznajomy_1_Statek_Wiezienny):
	Global_Variables.dialogic_is_now_running = false
	turn_on_the_player()
	get_parent().get_node("Player/Menu_And_HUD/HP_Bar").visible = true
	get_parent().get_node("Purple_Troll/Player_Detector/E_Button").visible = true
	print('Now you can resume with the game :)')	
	
func _on_Player_Detector_area_entered(area):
	get_parent().get_node("Purple_Troll/Player_Detector/E_Button").visible = true
	player_is_in_area = true
	print("You are in good distance to start talk")

func _on_Player_Detector_area_exited(area):
	get_parent().get_node("Purple_Troll/Player_Detector/E_Button").visible = false
	player_is_in_area = false
	print("You are not in good distance to start talk")

func turn_on_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(true)

func turn_off_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(false)
		
