extends HBoxContainer

onready var b0 = $Button0
onready var b1 = $Button1
onready var b2 = $Button2
onready var buttons = [b0,b1,b2]
onready var player = get_parent().get_parent().get_node("Player")
onready var scenery = get_parent().get_parent().get_node("Scenery/AnimatedSprite")
onready var scenery2 = get_parent().get_parent().get_node("Scenery/AnimatedSprite2")
onready var mcHands = [preload("res://assets/sprites/pedra_mc.png"),preload("res://assets/sprites/papel_mc.png"),preload("res://assets/sprites/tesoura_mc.png")]
signal buttonReady
signal stopScenery
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("buttonReady", player, "reactionTime")
	self.connect("stopScenery", scenery, "stop")
	self.connect("stopScenery", scenery2, "stop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Ao receber o sinal do ghost ele deve definir a ordem dos botões
func set_buttons(flag):
	randomize()
	var i = randi()%3
	if flag == 0:
		#pedra
		buttons[i].value = 0
		buttons[i].Icon = mcHands[0]
		#ERRO
		if i == 0:
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 1:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 2:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
	elif flag == 1:
		#papel
		buttons[i].value = 1
		buttons[i].Icon = mcHands[1]
		if i == 0:
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 1:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 2:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
	elif flag == 2:
		#tesoura
		buttons[i].value = 2
		buttons[i].Icon = mcHands[2]
		if i == 0:
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 1:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b2.value = randi()%3
			b2.Icon = mcHands[b2.value]
		elif i == 2:
			randomize()
			b0.value = randi()%3
			b0.Icon = mcHands[b0.value]
			randomize()
			b1.value = randi()%3
			b1.Icon = mcHands[b1.value]
	self.show()
	get_parent().get_node("ProgressBar").show()
	get_parent().get_node("Tween").interpolate_property(get_parent().get_node("ProgressBar"),"value", get_parent().get_node("ProgressBar").value, 100, player.get_node("reactionTimer").get_wait_time())
	get_parent().get_node("Tween").start()
	emit_signal("stopScenery")
	emit_signal("buttonReady")
	#scenery.pause()
	

