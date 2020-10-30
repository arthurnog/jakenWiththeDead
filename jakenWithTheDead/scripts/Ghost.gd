extends Node2D

onready var sprite0 = $Sprite
onready var sprite1 = $Sprite1
#substituir pelas animações
onready var gTimer = $Timer
#tempo para aparecer a jogada do ghost

export (int) var flag
signal flag

onready var windowsSize = get_viewport_rect().size

func _ready():
	position = Vector2(windowsSize.x/2, 0)
	$Tween.interpolate_property(self, "position", position, position+Vector2(0,200),1)
	$Tween.start()
	gTimer.start()
	

#func _process(delta):
#	pass

#var jogada = 0, 1, 2
func set_play():
	randomize()
	flag = int(rand_range(0,2))
	#escolher textura da Sprite1
	emit_signal("flag", flag)


func _on_Timer_timeout():
	set_play()
	sprite1.show()
	pass # Replace with function body.
