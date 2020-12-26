extends Panel
class_name HRadioButton # Two horizontal buttons that can't be both selected, allowing "none" as an option.
signal choice

export var allow_none: bool = true
export var disable_active_choice: bool = false
export var choices: Array = ["left", "right"]

onready var left_button = $Margin/Container/Left
onready var right_button = $Margin/Container/Right

func _ready():
	# do not replace "left" or "right" here, change the Choices array in the inspector
	left_button.connect("toggled",self,"_on_button_pressed",["left"])
	right_button.connect("toggled",self,"_on_button_pressed",["right"])
	left_button.text = choices[0]
	right_button.text = choices[1]

func _on_button_pressed(pressed_down:bool, option:String):
	if pressed_down:
		match option:
			"left":
				emit_signal("choice",choices[0])
				right_button.set_pressed(false)
				# put any other left_button functionalities here
			"right":
				emit_signal("choice",choices[1])
				left_button.set_pressed(false)
				# put any other right_button functionalities here
		check_active_choice()
		return
	if allow_none == false:
		match option:
			"left":
				right_button.set_pressed(true) # recursive callback
			"right":
				left_button.set_pressed(true) # recursive callback
		return
	if left_button.is_pressed() == right_button.is_pressed():
		emit_signal("choice","none")

func check_active_choice():
	if disable_active_choice:
		right_button.set_disabled(right_button.is_pressed())
		left_button.set_disabled(left_button.is_pressed())
	else:
		right_button.set_disabled(false)
		left_button.set_disabled(false)
