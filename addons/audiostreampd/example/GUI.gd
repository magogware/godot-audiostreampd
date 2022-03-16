extends Control


var freq: float = 440.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.stream.flot("freq", freq)
	$AudioStreamPlayer.stream.updater.connect("timeout", self, "elapsed")
	
func elapsed():
	$AudioStreamPlayer.stream.flot("freq", freq)

func _on_Play_pressed():
	$AudioStreamPlayer.play()

func _on_Stop_pressed():
	$AudioStreamPlayer.stop()

func _on_Up_pressed():
	freq += 10.0
	# The following style of message delivery should be avoided:
	# $AudioStreamPlayer.stream.flot("freq", freq)
	# The AudioStreamPd should be given messages when its timer elapses
	# and it refills its buffer (i.e.: with the "elapsed" signal), because
	# this ensures that only a *single* message
	# is sent (with the most up-to-date message value), meaning the PdStream library
	# won't be overwhelmed with messages; being forced to deliver too many messages in
	# too short a time will crash the PdStream library.

func _on_Down_pressed():
	freq -= 10.0
	#$AudioStreamPlayer.stream.flot("freq", freq)
