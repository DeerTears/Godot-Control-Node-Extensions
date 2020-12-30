extends Control
class_name VRadioButton # Two vertical buttons that can't be both selected, allowing "none" as an option.
signal choice

export var allow_none: bool = true
export var disable_active_choice: bool = false
export var choices: Array = ["top", "bottom"]

onready var top_button = $Margin/Container/Top
onready var bottom_button = $Margin/Container/Bottom

func _ready():
	# do not replace "top" or "bottom" here, change the Choices array in the inspector
	top_button.connect("toggled",self,"_on_button_pressed",["top"])
	bottom_button.connect("toggled",self,"_on_button_pressed",["bottom"])
	top_button.text = choices[0]
	bottom_button.text = choices[1]

func _on_button_pressed(pressed_down:bool, option:String):
	if pressed_down:
		match option:
			"top":
				emit_signal("choice",choices[0])
				bottom_button.set_pressed(false)
				# put any other top_button functionalities here
			"bottom":
				emit_signal("choice",choices[1])
				top_button.set_pressed(false)
				# put any other bottom_button functionalities here
		check_active_choice()
		return
	if allow_none == false:
		match option:
			"top":
				bottom_button.set_pressed(true) # recursive callback
			"bottom":
				top_button.set_pressed(true) # recursive callback
		return
	if top_button.is_pressed() == bottom_button.is_pressed():
		emit_signal("choice","none")

func check_active_choice():
	if disable_active_choice:
		bottom_button.set_disabled(bottom_button.is_pressed())
		top_button.set_disabled(top_button.is_pressed())
	else:
		bottom_button.set_disabled(false)
		top_button.set_disabled(false)
