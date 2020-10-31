extends Node2D

onready var sprite = $Sprite
#substituir pelas animações
onready var timer = $reactionTimer
#tempo que o jogador tem para reagir
signal defeat
signal gameOver
signal imOk

var lifes = 3


func _ready():
	connect("defeat", get_parent().get_node("enemyFarm"), "playerDefeat")
	connect("defeat", get_parent().get_node("Scenery/AnimatedSprite"), "backwards")
	connect("defeat", get_parent().get_node("Scenery/AnimatedSprite2"), "backwards")
	connect("imOk", get_parent().get_node("Scenery/AnimatedSprite"), "forwards")
	connect("imOk", get_parent().get_node("Scenery/AnimatedSprite2"), "forwards")
	connect("gameOver", get_parent().get_node("enemyFarm"), "gameOver")
	pass

func _process(delta):
	if lifes < 0:
		emit_signal("gameOver")

func playerFlee():
	if lifes > -1:
		emit_signal("defeat")
		$Sprite.play("fleeing")
		$scaryTimer.start()
		lifes -= 1
		get_parent().get_node("GUI/MarginContainer2/LifeCounter").text = "LIVES = " + str(lifes)
		get_parent().get_node("GUI/buttonContainer").hide()
		get_parent().get_node("GUI/ProgressBar").hide()
	#cenario corre pra tras

func _on_Button0_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button0").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		playerFlee()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()


func _on_Button1_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button1").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		playerFlee()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()


func _on_Button2_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button2").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		playerFlee()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()


func _on_scaryTimer_timeout():
	$Sprite.play("running")
	emit_signal("imOk")
	#cenário corre pra frente

func reactionTime():
	$reactionTimer.start()
	#$Tween.interpolate_property($ProgressBar, "value", $ProgressBar.value, 100, $reactionTimer.get_timer_process_mode())

func _on_reactionTimer_timeout():
	playerFlee()
	
