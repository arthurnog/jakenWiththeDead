extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	pass # Replace with function body.




func _on_return_pressed():
	get_tree().change_scene("res://scenes/INICIO.tscn")
