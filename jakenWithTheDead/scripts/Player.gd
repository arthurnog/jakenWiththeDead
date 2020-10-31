extends Node2D

onready var sprite = $Sprite
#substituir pelas animações
onready var timer = $reactionTimer
#tempo que o jogador tem para reagir
signal defeat


func _ready():
	connect("defeat", get_parent().get_node("enemyFarm"), "playerDefeat")
	pass

#func _process(delta):
#	pass

func playerFlee():
	$Sprite.play("fleeing")
	$scaryTimer.start()
	#cenario corre pra tras
	pass


func _on_Button0_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button0").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		emit_signal("defeat")
		playerFlee()


func _on_Button1_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button1").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		emit_signal("defeat")
		playerFlee()


func _on_Button2_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button2").value
	if value != get_parent().get_node("enemyFarm").currentFlag:
		emit_signal("defeat")
		playerFlee()


func _on_scaryTimer_timeout():
	$Sprite.play("running")
	#cenário corre pra frente

func reactionTime():
	$reactionTimer.start()

func _on_reactionTimer_timeout():
	emit_signal("defeat")
	pass # Replace with function body.
