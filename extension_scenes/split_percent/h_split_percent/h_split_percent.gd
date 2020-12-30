tool
extends HSplitContainer
class_name HSplitPercent

export (float, 0.0, 1.0, 0.001) var split_percent = 0.0 setget edit_split_percent
var first_child_minimum_x = 0

# bug: having a first child that cannot reduce its rect_size.x to 0 offsets the slider, making it appear inaccurate and broken at the end, although it always returns to normal.
# this bug makes the slider end early by a certain decimal, which is always (get_child(0).rect_size.x / self.rect_size.x).
# one possible fix: take our first child's rect_size.x when split_percent == 0, then compare it against our own container rect_size.x, to get the amount we'll be overshooting
# then, remove this ratio (ex. 0.04296875) from 
# then, don't move anything if we're still in the first 0.04296... of our offset.

func edit_split_percent(amount:float):
	if Engine.is_editor_hint() == false:
		return
	split_percent = amount
	get_first_child_min_x()
	var movement = lerp(0.0, rect_size.x, amount)
	split_offset = movement

func _on_HSplitPercent_sort_children():
	var movement = lerp(0.0, rect_size.x, split_percent)
	split_offset = movement

# fixing stuff



func get_first_child_min_x():
	if split_percent == 0:
		first_child_minimum_x = get_child(0).rect_size.x
	if split_percent == 1:
		first_child_minimum_x = (get_child(0).rect_size.x - self.rect_size.x)
		pass
	else:
		print("split_percent isn't 0 or 1, we can't reliably get our first child's minimum x size yet")
		# refactor: ...or can we?

func potential_fix():
	var movement = lerp(first_child_minimum_x, rect_size.x, split_percent)
	split_offset = movement
