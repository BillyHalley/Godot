extends Node

var score = Global.score

func _ready():
	update_score()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func _on_TouchScreenButton_pressed():
	print("Touched")
