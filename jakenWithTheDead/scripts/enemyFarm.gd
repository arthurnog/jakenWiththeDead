extends Node

onready var spawn = get_parent().get_node("spawn")
onready var player = get_parent().get_node("Player")
var score = 0
var enemy = preload("res://scenes/Ghost.tscn")
var currentFlag = -1
var currentEnemy = null

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enemySpawn():
	var enemyInstance = enemy.instance()
	enemyInstance.connect("flag", get_parent().get_node("GUI/buttonContainer"), "set_buttons")
	enemyInstance.connect("flag", self, "set_flag")
	enemyInstance.connect("killed", self, "enemyKill")
	add_child(enemyInstance)
	currentEnemy = enemyInstance
	
func set_flag(flag):
	currentFlag = flag

func _on_spawn_timeout():
	enemySpawn()
	#player.get_node("reactionTimer").start()
	pass # Replace with function body.
	
func enemyKill():
	score += 1
	get_parent().get_node("GUI/MarginContainer/ScoreCounter").text = "SCORE = " + str(score)
	spawn.start()
	#get_parent().get_node("GUI/Container/killCounter").text = "Eliminados = " + str(kills)
	
func playerDefeat():
	currentEnemy.enemyWin()
	spawn.start()

func gameOver():
	get_tree().quit()

func _on_Button0_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button0").value
	if value == currentFlag:
		currentEnemy.enemyDead()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()
	#get_parent().get_node("Scenery").play()
	#else
		#player foge

func _on_Button1_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button1").value
	if value == currentFlag:
		currentEnemy.enemyDead()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()
	#get_parent().get_node("Scenery").play()
	#else
		#player foge

func _on_Button2_pressed():
	var value = get_parent().get_node("GUI/buttonContainer/Button2").value
	if value == currentFlag:
		currentEnemy.enemyDead()
	get_parent().get_node("GUI/buttonContainer").hide()
	get_parent().get_node("GUI/ProgressBar").hide()
	#get_parent().get_node("Scenery").play()
	#else
		#player foge
