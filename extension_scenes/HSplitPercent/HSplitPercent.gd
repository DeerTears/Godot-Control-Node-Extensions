tool

extends HSplitContainer

export (float, 0.0, 1.0, 0.001) var split_percent = 0.0 setget edit_split_percent

func edit_split_percent(amount:float):
	split_percent = amount
	var movement = lerp(0.0, rect_size.x, amount)
	split_offset = movement
