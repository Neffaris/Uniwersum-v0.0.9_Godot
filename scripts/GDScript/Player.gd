extends KinematicBody2D

var motion_speed = 150 # Pixels/second.
var run_speed = 150
var current_animation = "idle"
var a = 0
var is_keyPressed = false
var is_shiftPressed = false

func _ready():
	dialogic_start()
	
# Left mouse button
#func _input(event):
#	if event.is_action_pressed("left_mouse_button"):
#		last_mouse_position = get_viewport().get_mouse_position()
		
func _physics_process(_delta):
	# Sterowanie klawiszami klawiatury
	var motion = Vector2()
	if is_keyPressed == false and is_shiftPressed == false:
		# is_keyPressed = false ponieważ gdy używamy myszy to sterowanie strzałkami i w/a/s/d jest dezaktywowane
														   #żeby się nie nachodziło
		motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		motion.y /= 2
		motion = motion.normalized() * motion_speed
		#warning-ignore:return_value_discarded
		move_and_slide(motion)
		# Bieg
	if is_keyPressed == false and is_shiftPressed == true:
		motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		motion.y /= 2
		motion = motion.normalized() * (motion_speed + run_speed)
		#warning-ignore:return_value_discarded
		move_and_slide(motion)
	else:
		pass
		
		# Sterowanie myszką
	current_animation = "idle"
	# Mouse Input
	var mouse = get_local_mouse_position()
	a = stepify(mouse.angle(), PI/4) / (PI/4)
	a = wrapi(int(a), 0, 8)
	#
	if Input.is_action_pressed("left_mouse_button") and Input.is_action_pressed("shift") and mouse.length() > 25:
		#mouse.length to odległość od gracza od której wykrywane ma być wciśnięcie przycisk
		is_keyPressed = true
		motion = mouse.normalized() * (motion_speed + run_speed)
		move_and_slide(motion)
	elif Input.is_action_pressed("left_mouse_button") and mouse.length() > 25:
		#mouse.length to odległość od gracza od której wykrywane ma być wciśnięcie przycisk
		is_keyPressed = true
		motion = mouse.normalized() * motion_speed
		move_and_slide(motion)
	if Input.is_action_just_released("left_mouse_button"):
		is_keyPressed = false
	elif Input.is_action_pressed("left_mouse_button") and Input.is_action_pressed("shift"):
		motion = mouse.normalized() * motion_speed
	if Input.is_action_pressed("shift"):
		is_shiftPressed = true
	if Input.is_action_just_released("shift"):
		is_shiftPressed = false
		#
# Zapisywanie i wczytywanie
func to_dictionary():
	return {
		"position" : [position.x, position.y],
#		"health" : health,
#		"health_max" : health_max,
#		"mana" : mana,
#		"mana_max" : mana_max,
#		"xp" : xp,
#		"xp_next_level" : xp_next_level,
#		"level" : level,
#		"health_potions" : health_potions,
#		"mana_potions" : mana_potions
	}
func from_dictionary(data):
	position = Vector2(data.position[0], data.position[1])
#	health = data.health
#	health_max = data.health_max
#	mana = data.mana
#	mana_max = data.mana_max
#	xp = data.xp
#	xp_next_level = data.xp_next_level
#	level = data.level
#	health_potions = data.health_potions
#	mana_potions = data.mana_potions
			
func dialogic_start():
	var new_dialog = Dialogic.start('First_Dialogue_Ever')
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, 'after_dialog')
	set_active(false)
	
func after_dialog(First_Dialogue_Ever):
	set_active(true)
	$Menu_And_HUD/HP_Bar.visible = true
	print("Dialogic - Now you can resume with the game :)")	

func set_active(active):
	set_physics_process(active)
	set_process(active)
	set_process_input(active)


