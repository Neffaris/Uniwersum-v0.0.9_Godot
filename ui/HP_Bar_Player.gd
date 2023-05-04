extends TextureRect

var hp_value = 25 # % - Percent

func _ready():
	get_parent().get_node("HP_Bar/Control/HP_Value").visible = false
	get_parent().get_node("HP_Bar/Control/HP_Value").text = "-----" + str(hp_value) + "%"
	$TextureProgress.value = hp_value

func set_percentage_value_int(value):
	
	$TextureProgress.value = value

func _on_Control_mouse_entered():
	get_parent().get_node("HP_Bar/Control/HP_Value").visible = true

func _on_Control_mouse_exited():
	# Timer
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_parent().get_node("HP_Bar/Control/HP_Value").visible = false
