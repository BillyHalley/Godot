extends Node

var score = Global.score

func _ready():
	update_score()

func update_score():
	$Score.text = "Score: " + str(Global.score)
	if(Global.score < 0):
		$AcceptDialog.popup()
