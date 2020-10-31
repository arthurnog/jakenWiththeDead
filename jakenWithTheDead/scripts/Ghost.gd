extends Node2D

onready var sprite0 = $Sprite
onready var sprite1 = $Sprite1
#substituir pelas animações
onready var gTimer = $Timer
#tempo para aparecer a jogada do ghost

export (int) var flag = 0
var dead = 0

signal flag
signal killed

onready var windowsSize = get_viewport_rect().size

func _ready():
	position = Vector2(windowsSize.x/2, 0)
	$Tween.interpolate_property(self, "position", position, position+Vector2(0,200),1)
	$Tween.start()
	gTimer.start()
	

#var jogada = 0, 1, 2
func set_play():
	randomize()
	flag = randi()%3
	#escolher textura da Sprite1
	emit_signal("flag", flag)
	
func enemyDead():
	$Sprite.play("die")
	yield($Sprite,"animation_finished")
	emit_signal("killed")
	queue_free()

func enemyWin():
	#$Sprite.play("win")
	queue_free()

func _on_Timer_timeout():
	set_play()
	sprite1.show()
	pass # Replace with function body.
