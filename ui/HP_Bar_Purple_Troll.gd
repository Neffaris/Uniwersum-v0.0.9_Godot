extends TextureRect


func _ready():
	$TextureProgress.value = 100 # % - Percent

func set_percentage_value_int(value):
	$TextureProgress.value = value
