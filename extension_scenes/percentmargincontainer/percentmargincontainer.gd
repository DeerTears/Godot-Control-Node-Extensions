tool

extends Container

export (float, 0.0, 1.0, 0.001) var horizontal_size = 1.0 setget edit_horizontal_size
export (float, 0.0, 1.0, 0.001) var vertical_size = 1.0 setget edit_vertical_size

func edit_horizontal_size(input:float):
	horizontal_size = input
	_on_sort_children()

func edit_vertical_size(input:float):
	vertical_size = input
	_on_sort_children()

func _on_sort_children():
	var child_count = get_child_count()
	for i in child_count:
		get_child(i).set_anchors_preset(Control.PRESET_WIDE)
		get_child(i).set_margins_preset(Control.PRESET_WIDE) # might not need this
		var full_size = rect_size
		var horizontal_movement = lerp(rect_size.x, 0.0, horizontal_size)
		var vertical_movement = lerp(rect_size.y, 0.0, vertical_size)
		# todo: replace $ with get_child(i)
		# todo: add 2nd scenetype that lets you do individual sides
		$ColorRect.rect_size.x = lerp(0.0, rect_size.x, horizontal_size)
		$ColorRect.rect_size.y = lerp(0.0, rect_size.y, vertical_size)
		$ColorRect.margin_right = -horizontal_movement + (horizontal_movement/2)
		$ColorRect.margin_left = horizontal_movement - (horizontal_movement/2)
		$ColorRect.margin_top = vertical_movement - (vertical_movement/2)
		$ColorRect.margin_bottom = -vertical_movement + (vertical_movement/2)

func edit_percent_margin(percent:float):
	pass
