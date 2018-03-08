extends CanvasLayer

func _ready():
	pass

func _on_Right_pressed():
	get_node("/root/global").touch_right = true


func _on_Left_pressed():
	get_node("/root/global").touch_left = true


func _on_Up_pressed():
	get_node("/root/global").touch_up = true


func _on_Left_released():
	get_node("/root/global").touch_left = false


func _on_Right_released():
	get_node("/root/global").touch_right = false


func _on_Up_released():
	get_node("/root/global").touch_up = false
