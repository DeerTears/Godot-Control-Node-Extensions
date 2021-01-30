extends Control

export (NodePath) var test
onready var notice_popup = $NoticePopup

func _ready():
	print(test)

func _on_TeamPicker_attempt_join(team:String):
	notice_popup.join_team(team)
