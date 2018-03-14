extends KinematicBody2D

const SPEED = 250

var moving = false
var movement_path = []
var destination_node
	
func _process(delta):
	if(!moving): 
		if( movement_path.size() > 0):
			destination_node = movement_path.pop_front()
			moving = true
	else:
		var distance = destination_node.get_global_transform().origin - get_global_transform().origin
		if( distance.length() < 5 ):
			position = destination_node.position
			moving = false
			Global.score -= destination_node.distance_from_previous
			Global.CURRENT_LOCATION = destination_node
			get_node("../HUD").update_score()
			destination_node.modulate = Color(0,1,0,1)
			if( movement_path.size() == 0 ):
				destination_node.rest_popup()
		else:
			var dir = distance.normalized()
			global_translate(dir*delta*SPEED)

func _on_Dialog_confirmed():
	movement_path = Global.temp_locations
	pass # replace with function body
