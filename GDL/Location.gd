extends Node2D

export(NodePath) var next_path
onready var next = get_node(next_path)

# Basic fatigue/reward mechanic
export(int) var distance_from_previous
export(int) var reward

onready var this = get_node(get_path())

func _ready():
	pass

func _on_Button_pressed():
	move(next)
	
func move(next_location):
	if( Global.CURRENT_LOCATION.next == this):
		get_node("../../Party").move(this)
		Global.CURRENT_LOCATION = this
		Global.score -= distance_from_previous
		Global.score += reward
		get_node("../../HUD").update_score()