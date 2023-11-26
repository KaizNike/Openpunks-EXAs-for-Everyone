extends Node

var exaScripts = [] setget exaScripts_Changed

signal scriptChangeEmit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func exaScripts_Changed(value):
	print(value)
	emit_signal("scriptChangeEmit", value)
	exaScripts = value
