extends ConfirmationDialog

func _ready():
	dialog_text = "Vuoi riposare per %s punti?" % get_parent().reward
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
