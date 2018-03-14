extends Node2D

export(NodePath) var next_path
onready var next = get_node(next_path)

# Basic fatigue/reward mechanic
export(int) var distance_from_previous
export(int) var reward

onready var THIS = get_node(get_path())

onready var PARTY = get_node("../../Party")

onready var HUD = get_node("../../HUD")

onready var DIALOG = get_node("../../Dialog")

func _ready():
	print("ready " + name)
	var t = name + "\nDist.: " + str(distance_from_previous) + "\nReward: " + str(reward)
	$Label.text = t
	modulate = Color(1,0.8,0,1)
	pass

func _on_Button_pressed():
	if(!PARTY.moving and Global.CURRENT_LOCATION != THIS):
		var dist = total_dist(Global.CURRENT_LOCATION, THIS)
		DIALOG.dialog_text = "Affaticamento totale: %d\nRiposo: %d" % [dist,THIS.reward]
		DIALOG.popup_centered()
		Global.temp_locations = find_destinations(Global.CURRENT_LOCATION, THIS)
		
func find_destinations(initial, final):
	var locations = [initial.next]
	if(initial.next != final):
		locations += find_destinations(initial.next, final)
	return locations
	
func total_dist(initial, final):
	var dist = initial.next.distance_from_previous
	if(initial.next != final):
		dist += total_dist(initial.next, final)
	return dist

func rest_popup():
	$RestPopup.popup_centered()

func _on_ConfirmationDialog_confirmed():
	Global.score += reward
	HUD.update_score()
