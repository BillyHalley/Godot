extends KinematicBody2D

const SPEED = 250

var motion = Vector2()
var dest = Vector2()
var moving = false
var prize = 0
var movement_path = []

func move(destination):
	motion = destination.position - position
	dest = destination.position
	moving = true
	

func _process(delta):
	if( movement_path.size() > 1 and !moving):
		var d = movement_path.pop_front()
		print("first: " + d.name)
		for loc in movement_path:
			print(loc.name)
		move(d)
		Global.score -= d.distance_from_previous
	elif(movement_path.size() == 1 and !moving):
		var d = movement_path.pop_front()
		print("first: " + d.name)
		for loc in movement_path:
			print(loc.name)
		move(d)
		Global.score -= d.distance_from_previous
		Global.score += d.reward
		Global.CURRENT_LOCATION = d
		print("Current: " + Global.CURRENT_LOCATION.name)
	if( position.distance_to(dest) < SPEED/100 and moving):
		position = dest
		motion = Vector2()
		moving = false
		get_node("../HUD").update_score()
	move_and_slide(motion.normalized() * SPEED)



func _on_Dialog_confirmed():
	movement_path = Global.temp_locations
	pass # replace with function body
