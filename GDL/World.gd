extends Node

var locations
var current_location

func _ready():
	Global.CURRENT_LOCATION = $Locations/Loc_A
	$Party.position = Global.CURRENT_LOCATION.position

	pass

func _process(delta):
	pass

func move_party(location):
	$Party.move(location)
#
