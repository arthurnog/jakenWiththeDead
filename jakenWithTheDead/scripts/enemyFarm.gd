extends Node

var enemy = preload("res://scenes/Ghost.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enemySpawn():
	var enemyinstance = enemy.instance()
	enemyinstance.connect("flag", get_parent().get_node("GUI/Container"), "set_buttons")
	
	add_child(enemyinstance)
	


func _on_spawn_timeout():
	enemySpawn()
	pass # Replace with function body.

