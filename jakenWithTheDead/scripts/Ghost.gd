extends Node2D

onready var sprite0 = $Sprite
onready var sprite1 = $Sprite1
#substituir pelas animações
onready var gTimer = $Timer
onready var ghostHands = [preload("res://assets/sprites/pedra_fantasma.png"),preload("res://assets/sprites/papel_fantasma.png"),preload("res://assets/sprites/tesoura_fantasma.png")]
onready var aSound = [preload("res://assets/sounds/ghost_show_0.wav"),preload("res://assets/sounds/ghost_show_1.wav"),preload("res://assets/sounds/ghost_show_2.wav")]
onready var dSound = [preload("res://assets/sounds/ghost_defeat_0.wav"),preload("res://assets/sounds/ghost_defeat_1.wav"),preload("res://assets/sounds/ghost_defeat_2.wav")]
#tempo para aparecer a jogada do ghost

export (int) var flag = 0
var dead = 0

signal flag
signal killed

onready var windowsSize = get_viewport_rect().size

func _ready():
	position = Vector2(windowsSize.x/2, 0)
	randomize()
	var i = randi()%3
	$audio1.stream = aSound[i]
	$audio1.play()
	$audio2.stream = dSound[i]
	$Sprite.play("show")
	$Tween.interpolate_property(self, "position", position, position+Vector2(0,200),1)
	$Tween.start()
	gTimer.start()
	

#var jogada = 0, 1, 2
func set_play():
	randomize()
	flag = randi()%3
	$Sprite1.texture = ghostHands[flag]
	#escolher textura da Sprite1
	emit_signal("flag", flag)
	
func enemyDead():
	$Sprite.play("die")
	dead = 1
	get_parent().get_node("../Player/reactionTimer").stop()
	$audio2.play()
	yield($Sprite,"animation_finished")
	emit_signal("killed")
	queue_free()

func empate():
	$Sprite1.hide()
	gTimer.start()
	

func enemyWin():
	#$Sprite.play("win")
	queue_free()

func _on_Timer_timeout():
	set_play()
	sprite1.show()
	$Sprite.play("idle")
	pass # Replace with function body.
