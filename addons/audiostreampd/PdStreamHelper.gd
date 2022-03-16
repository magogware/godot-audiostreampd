extends Node
class_name PdStreamHelper

var player: Node = null

func _ready():
	player = get_parent()	
	player.stream.setup(player)
	player.call_deferred("add_child", player.stream.updater)
