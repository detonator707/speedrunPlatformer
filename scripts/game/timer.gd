extends Timer

@onready var label: Label = %Label
@onready var UI = get_node("/root/Game/Character/Camera2D/UI")

var timeInSeconds: int = 0

func _ready() -> void:
	UI.visible = true
	timeout.connect(_on_timer_timeout) 
	print("Timer _ready() called – connecting signal and starting...")
	start()
	print("Timer started – wait time:", wait_time, " one_shot:", one_shot)                             

func _on_timer_timeout() -> void:
	timeInSeconds += 1
	print("TIMEOUT FIRED ", timeInSeconds)
	var minutes = timeInSeconds / 60
	var seconds = timeInSeconds % 60
	
	label.text = "%02d:%02d" % [minutes, seconds]
	print("Label text set to", label.text)
