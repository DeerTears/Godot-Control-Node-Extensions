extends Panel

# didn't use regular popup just for fun

onready var information = $MarginContainer/VBoxContainer/Information

func join_team(team:String):
	show()
	information.text = "You have chosen %s team!" % [team]
