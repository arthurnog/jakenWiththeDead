extends Tween


onready var progressBar = get_parent().get_node("ProgressBar")
onready var player = get_parent().get_parent().get_node("Player")


func _ready():
# warning-ignore:return_value_discarded
	interpolate_property(progressBar,"value", progressBar.value, 100, player.get_node("reactionTimer").get_wait_time())
	self.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
