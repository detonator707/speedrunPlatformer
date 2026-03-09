extends Timer

@onready var label: Label = %Label


var timeInSeconds: int = 0

func _ready() -> void:
	%Label.visible = true
	timeout.connect(_on_timer_timeout) 
	
	

func _on_timer_timeout() -> void:
	timeInSeconds += 1
	#print("TIMEOUT FIRED ", timeInSeconds)
	var minutes = timeInSeconds / 60
	var seconds = timeInSeconds % 60
	
	label.text = "%02d:%02d" % [minutes, seconds]
	#print("Label text set to", label.text)
	
func reset() -> void:
	timeInSeconds = 0
	label.text = "00:00"
	start()
