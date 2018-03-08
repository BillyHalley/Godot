extends Area2D
signal hit

export (int) var SPEED  # how fast the player will move (pixels/sec)
var velocity = Vector2()  # the player's movement vector
var screensize  # size of the game window
var score

func _ready():
	screensize = get_viewport_rect().size
	hide()
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_body_entered(body):
	hide() # Player disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.disabled = true
	pass # replace with function body

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
