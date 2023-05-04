extends Node

var test_music_1 = load("res://audio/music/to wszystko (outro).mp3")
var test_music_2 = load("res://audio/music/playtest.mp3")

func _ready():
	pass

func play_music():
	$Music_Player.stream = test_music_1
	$Music_Player.play()

func stop_music():
	$Music_Player.stop()
	
