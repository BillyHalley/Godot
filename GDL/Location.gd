extends Node2D

export(NodePath) var next
export(int) var distance
export(int) var reward

func _ready():
	pass


func _on_Button_pressed():
	Global.next_turn(next)
