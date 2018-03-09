extends Node

var score = 200

var LOCATION_A = {'name' : 'Loc_A', 'paths':{ LOCATION_B: 100 }, 'reward' : 125 }
var LOCATION_B = {'name' : 'Loc_B', 'paths':{ LOCATION_C: 200 }, 'reward' : 250 }
var LOCATION_C = {'name' : 'Loc_C', 'paths':{ LOCATION_A: 50 }, 'reward' : 75 }

var CURRENT_LOCATION = LOCATION_A

func _ready():
	pass
	
func next_turn(next_location):
	if CURRENT_LOCATION.paths.has(next_location):
		print("next_turn")
		var distance = CURRENT_LOCATION.paths.next_location
		CURRENT_LOCATION = CURRENT_LOCATION.keys()[CURRENT_LOCATION.keys().find(next_location)]
		score = score - distance + CURRENT_LOCATION.reward