extends HBoxContainer

onready var b0 = $Button0
onready var b1 = $Button1
onready var b2 = $Button2
onready var buttons = [b0,b1,b2]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
		#buttons[i].set_text("0")
		if i == 0:
			randomize()
			b1.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 1:
			randomize()
			b0.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 2:
			randomize()
			b0.value = randi()%3
			randomize()
			b0.value = randi()%3
	elif flag == 1:
		#papel
		buttons[i].value = 1
		if i == 0:
			randomize()
			b1.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 1:
			randomize()
			b0.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 2:
			randomize()
			b0.value = randi()%3
			randomize()
			b0.value = randi()%3
	elif flag == 2:
		#tesoura
		buttons[i].value = 2
		if i == 0:
			randomize()
			b1.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 1:
			randomize()
			b0.value = randi()%3
			randomize()
			b2.value = randi()%3
		elif i == 2:
			randomize()
			b0.value = randi()%3
			randomize()
			b0.value = randi()%3
	self.show()

