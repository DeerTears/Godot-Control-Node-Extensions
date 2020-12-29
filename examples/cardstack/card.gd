extends Panel

onready var health_label = $MarginContainer/MarginContainer/VBoxContainer/Stats/Health
onready var damage_label = $MarginContainer/MarginContainer/VBoxContainer/Stats/Damage
onready var desc_label = $MarginContainer/MarginContainer/VBoxContainer/Description
onready var name_label = $MarginContainer/MarginContainer/VBoxContainer/Name
onready var color_panel = $MarginContainer/Panel
enum types {
	WATER,
	GRASS,
	FIRE,
}

var type: int
export var draggable: bool = true

func _ready():
	randomize()
	type = randi() % types.size()
	update_labels(type)
	update_style(type)
	if draggable:
		connect("gui_input",self,"_on_gui_input")

var being_dragged: bool = false

func _on_gui_input(event:InputEvent):
	if event.is_action_pressed("mouse_down"):
		being_dragged = true
	if event.is_action_released("mouse_down"):
		being_dragged = false

func _process(delta):
	if being_dragged:
		var mousepos = get_viewport().get_mouse_position() - (rect_size / 2)
		rect_position = lerp(rect_position,mousepos,delta*10)

func update_style(passed_type:int):
	var box = StyleBoxFlat.new()
	print(box)
	box.resource_path = "res://examples/cardstack/styleboxes/water.stylebox"
	#color_panel.add_stylebox_override("", box) # it's not this
	# miiiiight have to use a shader for this

func update_labels(passed_type:int):
	match passed_type:
		types.WATER:
#			health_label.append_bbcode("center") ??? does it work like this?
			health_label.bbcode_text = ("[center]%s [img=24]%s[/img][/center]"
			% ["50","res://examples/cardstack/icons/bubbles.png"])
			
			damage_label.bbcode_text = ("[center]%s [img=24]%s[/img]"
			% ["80","res://examples/cardstack/icons/bubbles.png"])
			
			name_label.text = "WATER"
			desc_label.text = "is water."

		types.FIRE:
			health_label.bbcode_text = ("[center]%s [img=24]%s[/img][/center]"
			% ["50","res://examples/cardstack/icons/flame.png"])
			
			damage_label.bbcode_text = ("[center]%s [img=24]%s[/img][/center]"
			% ["80","res://examples/cardstack/icons/flame.png"])
			
			name_label.text = "FIRE"
			desc_label.text = "is fire."

		types.GRASS:
			health_label.bbcode_text = ("[center]%s [img=24]%s[/img][/center]"
			% ["50","res://examples/cardstack/icons/lotus.png"])
			
			damage_label.bbcode_text = ("[center]%s [img=24]%s[/img][/center]"
			% ["80","res://examples/cardstack/icons/lotus.png"])
			
			name_label.text = "GRASS"
			desc_label.text = "is grass."
		


func _on_Card_mouse_entered():
	$Ping.emitting = true
	$Magic.emitting = true

func _on_Card_mouse_exited():
	$Magic.emitting = false
	$Ping.emitting = false
