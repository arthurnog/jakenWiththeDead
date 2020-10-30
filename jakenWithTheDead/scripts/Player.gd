extends Node2D

onready var sprite = $Sprite
#substituir pelas animações
onready var timer = $reactionTimer
#tempo que o jogador tem para reagir


func _ready():
	pass

#func _process(delta):
#	pass

func playerFlee():
	get_parent().get_node("enemyFarm").score -= 1
	#toca animação do player fugindo
	pass


func _on_Button0_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button0").value
	if value != get_parent().get_node("enemyFarm").enemy.flag:
		playerFlee()
	pass # Replace with function body.


func _on_Button1_pressed():
	pass # Replace with function body.


func _on_Button2_pressed():
	pass # Replace with function body.
