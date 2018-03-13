extends KinematicBody2D

const SPEED = 500

var motion = Vector2()
var dest = Vector2()
var moving = false
var prize = 0

func move(destination):
	motion = destination.position - position
	dest = destination.position
	moving = true
	
func _process(delta):
#	if(moving):
#		Global.score -= 1
	if( position.distance_to(dest) < SPEED/100 and moving):
		position = dest
		motion = Vector2()
#		Global.score += prize
#		get_parent().get_children()[0].update_score()
		moving = false
	move_and_slide(motion.normalized() * SPEED)
