extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/GAME.tscn")
	pass # Replace with function body.


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/CREDITS.tscn")
	pass # Replace with function body.
