extends Node

var locations
var current_location

func _ready():
	Global.CURRENT_LOCATION = $Locations/Loc_A
	$Party.position = Global.CURRENT_LOCATION.position
	pass

func _process(delta):
	pass


#func _on_Touch0_pressed():
#	if(!$Party.moving and Global.CURRENT_LOCATION.paths.has_key('Loc_A')):
#		current_location = locations[0]
#		move_player($Party, current_location, 100)
#
#func _on_Touch1_pressed():
#	if(!$Party.moving):
#		current_location = locations[1]
#		next_location = locations[2]
#		move_player($Party, current_location, 150)
#
#func _on_Touch2_pressed():
#	if(!$Party.moving):
#		current_location = locations[2]
#		next_location = locations[0]
#		move_player($Party, current_location, 75)
#
func move_party(location):
	$Party.move(location)
#
