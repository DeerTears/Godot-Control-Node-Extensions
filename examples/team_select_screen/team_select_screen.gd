extends Control

onready var notice_popup = $NoticePopup

func _on_TeamPicker_attempt_join(team:String):
	notice_popup.join_team(team)
