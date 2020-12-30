extends Control

export var left_to_right: bool = true
export var top_to_bottom:bool = true

func _ready():
	yield(get_tree(),"idle_frame") # let children ready up
	sort_children()

func sort_children():
	var child_count = get_child_count()
	var step = rect_size / child_count
	if left_to_right:
		for i in child_count:
			get_child(i).rect_position.x = step.x * i
	else:
		for i in child_count:
			get_child(i).rect_position.x = self.rect_size.x - (step.x * i)
	if top_to_bottom:
		for i in child_count:
			get_child(i).rect_position.y = step.y * i
	else:
		for i in child_count:
			get_child(i).rect_position.y = self.rect_size.y - (step.y * i)
