extends Control

signal attempt_join

onready var flag = $Margin/Flag
onready var join_button = $Join

var team = "none"

func _ready():
	flag.color = Color.gray
	join_button.set_disabled(true)

func _on_HRadioButton_choice(option:String):
	match option:
		"Red":
			flag.color = Color.darkred
			join_button.set_disabled(false)
		"Blue":
			flag.color = Color.darkblue
			join_button.set_disabled(false)
		"Yellow": # try changing a string in HRadio's "choices" array to Yellow!
			flag.color = Color.goldenrod
			join_button.set_disabled(false)
		"Green": # try changing a string in HRadio's "choices" array to Green!
			flag.color = Color.darkgreen
			join_button.set_disabled(false)
		"none":
			flag.color = Color.gray
			join_button.set_disabled(true)
	team = option

func _on_Join_pressed():
	emit_signal("attempt_join", team)
