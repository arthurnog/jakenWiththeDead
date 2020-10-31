extends AnimatedSprite

export (int) var vel = 10


func _on_VisibilityNotifier2D_screen_exited():
	position.y = -1024

func _process(delta):
	position.y += vel*delta
	
func backwards():
	vel = -10
func forwards():
	vel = 10
func stop():
	vel = 0
