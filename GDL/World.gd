extends Node

var locations
var current_location

func _ready():
	locations = $Locations.get_children()
	current_location = locations[locations.find(Global.CURRENT_LOCATION.name)]
	$Party.position = current_location.position
	var loc = $Location.new()
	loc.position = Vector2d(60,60)
	pass

func _process(delta):
	pass


func _on_Touch0_pressed():
	if(!$Party.moving and Global.CURRENT_LOCATION.paths.has_key('Loc_A')):
		current_location = locations[0]
		move_player($Party, current_location, 100)
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
func move_player(player, location, prize):
	player.move(location.position, prize)
#
