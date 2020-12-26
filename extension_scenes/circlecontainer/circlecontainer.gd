extends Container

export var steps: int = 2

func _ready():
	var center = rect_size/2
	var divisions = get_child_count()
	var step = rect_size / divisions
	for i in get_child_count():
		get_child(i).rect_position = step * i
