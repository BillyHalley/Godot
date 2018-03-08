extends Node


func _on_InitialScore_item_selected(ID):
	Global.score = int($InitialScore.get_item_text(ID))
	get_tree().change_scene("World.tscn")
