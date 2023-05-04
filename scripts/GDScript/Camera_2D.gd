extends Camera2D

var zoom_min = Vector2(.500001, .500001)
var zoom_max = Vector2(0.9, 0.9)
var zoom_speed = Vector2(.08, .08)
var des_zoom = zoom

func _process(delta):
	#WYGŁADZANIE PRZYBLIŻENIA I ODDALANIA
	zoom = lerp(zoom, des_zoom, .5)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				if des_zoom > zoom_min:
					des_zoom -= zoom_speed
			if event.button_index == BUTTON_WHEEL_DOWN:
				if des_zoom < zoom_max:
					des_zoom += zoom_speed
				
				#BEZ WYGŁADZANIA PRZYBLIŻENIA I ODDALANIA
#func _input(event):
	#if event is InputEventMouseButton:
		#if event.is_pressed():
			#if event.button_index == BUTTON_WHEEL_UP:
				#if zoom > zoom_min:
					#zoom -= zoom_speed
			#if event.button_index == BUTTON_WHEEL_DOWN:
				#if zoom < zoom_max:
					#zoom += zoom_speed
