extends Control


func _ready():
	pass


func _on_Fullscreen_Check_Button_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
