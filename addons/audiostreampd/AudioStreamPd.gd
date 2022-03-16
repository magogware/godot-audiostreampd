extends AudioStreamGenerator
class_name AudioStreamPd

export(String, FILE, "*.pd") var patch
export(float) var interval

var player: Node = null
var playback: AudioStreamGeneratorPlayback = null
var pdstream: PdStream = null
var updater: Timer = null
		
func setup(player_node: Node):
	pdstream = PdStream.new()
	pdstream.create() 
	pdstream.open(patch)
	
	updater = Timer.new()
	updater.autostart = true
	updater.connect("timeout", self, "elapsed")
	updater.wait_time = interval
	
	player = player_node
	playback = player.get_stream_playback()
	
func elapsed():
	if player.playing:
		_fill_buffer()
	else:
		playback.clear_buffer()

func _fill_buffer():
	var available = playback.get_frames_available()
	var ticks = int(ceil(max(1, available/64.0)))
	var frames: PoolVector2Array = pdstream.perform(ticks)
	var counter = 0
	while available > 0:
		playback.push_frame(frames[counter]) # Audio frames are stereo.
		counter = counter + 1
		available = available - 1

func open(new_patch: String):
	pdstream.open(new_patch)

func flot(recv: String, f: float):
	pdstream.flot(recv, f)
	
func bang(recv: String):
	pdstream.bang(recv)
	
func symbol(recv: String, s: String):
	pdstream.symbol(recv, s)
	
func add_float(f: float):
	pdstream.add_float(f)
	
func add_symbol(s: String):
	pdstream.add_symbol(s)
	
func start_message(l: int):
	pdstream.start_message(l)
	
func finish_message(recv: String, msg: String):
	pdstream.finish_message(recv, msg)
