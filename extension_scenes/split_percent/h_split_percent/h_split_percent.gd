tool
extends HSplitContainer
class_name HSplitPercent

export (float, 0.0, 1.0, 0.001) var split_percent = 0.0 setget edit_split_percent
var first_child_minimum_x = 0

# bug: having a first child that cannot reduce its rect_size.x to 0 offsets the slider, making it appear inaccurate and broken at the end, thankfully nothing happens inconsistently.
# this bug makes the slider end early by a certain decimal, which is always (get_child(0).rect_size.x / self.rect_size.x).
# so far I can't fix this issue, replacing 0 in the lerp with the child's minimum size is not the answer.

func edit_split_percent(amount:float):
	split_percent = amount
	var movement = lerp(0.0, rect_size.x, amount)
	split_offset = movement

func _on_HSplitPercent_sort_children():
	var movement = lerp(0.0, rect_size.x, split_percent)
	split_offset = movement
	print("%s, %s" % [split_offset, movement])
