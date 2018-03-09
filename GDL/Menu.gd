extends Node


func _on_TouchScreenButton_pressed():
	var id = $InitialScore.get_selected_id()
	Global.score = int($InitialScore.get_item_text(id))
	get_tree().change_scene("World.tscn")