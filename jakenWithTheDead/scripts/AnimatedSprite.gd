extends AnimatedSprite

export (int) var vel = 100


func _on_VisibilityNotifier2D_screen_exited():
	if vel > 0:
		position.y = -1024
	elif vel < 0:
		position.y = 1024

func _process(delta):
	position.y += vel*delta
	
func backwards():
	vel = -300
func forwards():
	vel = 100
func stop():
	vel = 0
