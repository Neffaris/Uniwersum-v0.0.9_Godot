extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []
var is_dialogue_active = false
export(float) var text_speed = 0.05
var know_purple_troll_name = false
var current_dialogue_id = 0

func _ready():
	$NinePatchRect.visible = false
	$Text_Speed_Timer.wait_time = text_speed
	
func play():
	$NinePatchRect.visible = true
	turn_off_the_player()
	if is_dialogue_active:
		return
		
	dialogues = load_dialogue()
	
	# First dialogue initialization
	if know_purple_troll_name == false:
		$NinePatchRect/Name.text = dialogues[0]['name']
		$NinePatchRect/Text.text = dialogues[0]['text']
		cool_text_animation()
		$NinePatchRect/Option_Button_1.text = dialogues[0]['option_1']
		$NinePatchRect/Option_Button_2.text = dialogues[0]['option_2']
		$NinePatchRect/Option_Button_4.text = dialogues[0]['option_3']
	else:
		$NinePatchRect/Name.text = dialogues[1]['name']
		$NinePatchRect/Text.text = dialogues[0]['text']
		cool_text_animation()
		$NinePatchRect/Option_Button_1.text = dialogues[1]['option_1']
		$NinePatchRect/Option_Button_2.text = dialogues[0]['option_2']
		$NinePatchRect/Option_Button_4.text = dialogues[0]['option_3']
		
	turn_off_the_player()
	is_dialogue_active = true
	$NinePatchRect.visible = true
	# Timer
	var t = Timer.new()
	t.set_wait_time(0.01)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$NinePatchRect/Option_Button_1.disabled = false
	$NinePatchRect/Option_Button_2.disabled = false
	$NinePatchRect/Option_Button_3.disabled = false
	$NinePatchRect/Option_Button_4.disabled = false

func next_dialogue():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		$Next_Dialogue_Timer.start()
		$NinePatchRect.visible = false
		turn_on_the_player()
		return
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogues[current_dialogue_id]['text']
	$NinePatchRect/Option_Button_1.text = dialogues[current_dialogue_id]['option_1']
	$NinePatchRect/Option_Button_2.text = dialogues[current_dialogue_id]['option_2']
	$NinePatchRect/Option_Button_4.text = dialogues[current_dialogue_id]['option_3']
	
	cool_text_animation()
	
func cool_text_animation():
	$NinePatchRect/Text.visible_characters = 0
	while $NinePatchRect/Text.visible_characters < len($NinePatchRect/Text.text):
		$NinePatchRect/Text.visible_characters += 1
		
		$Text_Speed_Timer.start()
		yield($Text_Speed_Timer, "timeout")
		
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())
		
func _on_Timer_timeout():
	is_dialogue_active = false

func turn_on_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(true)

func turn_off_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(false)
	
func _on_Option_Button_1_pressed():
	print("Button 1 has been pressed")
	if $NinePatchRect/Option_Button_1.text == "Co robisz?":
		$NinePatchRect/Text.text = dialogues[2]['text']
		cool_text_animation()
		$NinePatchRect/Option_Button_1.text = dialogues[2]['option_1']
	elif $NinePatchRect/Option_Button_1.text == "Rozumiem":
		$NinePatchRect/Text.text = dialogues[1]['text']
		cool_text_animation()
		$NinePatchRect/Option_Button_1.text = dialogues[1]['option_1']
	else:
		$NinePatchRect/Name.text = dialogues[1]['name']
		know_purple_troll_name = true
		$NinePatchRect/Text.text = dialogues[1]['text']
		cool_text_animation()
		$NinePatchRect/Option_Button_1.text = dialogues[1]['option_1']
	
func _on_Option_Button_2_pressed():
	print("Button 2 has been pressed")
	$NinePatchRect/Text.text = dialogues[3]['text']
	cool_text_animation()
	$NinePatchRect/Option_Button_2.text = dialogues[3]['option_1']
	$NinePatchRect/Option_Button_2.visible = false

func _on_Option_Button_3_pressed():
	pass # Replace with function body.

func _on_Option_Button_4_pressed():
	print("Button 3 has been pressed")
	turn_on_the_player()
	$NinePatchRect.visible = false

