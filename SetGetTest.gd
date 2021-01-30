tool
extends Timer

export var test: bool = false setget set_one_shot
class_name SetGetTimer

func set_one_shot(value):
	print(value)
	.set_one_shot(value)
