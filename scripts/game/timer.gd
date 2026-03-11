extends Timer

@onready var label: Label = %Label
@onready var best_label: Label = get_node("/root/Game/Character/Camera2D/UI/Highscore")


var timeInSeconds: int = 0
var bestTime: int = 999999

func _ready() -> void:
	%Label.visible = true
	timeout.connect(_on_timer_timeout) 
	best_label.text = "--:--"
	
	

func update_label(target_label: Label, total_seconds: int) -> void:
	var minutes = total_seconds / 60 
	var seconds = total_seconds % 60
	target_label.text = "%02d:%02d" % [minutes, seconds]
	

func check_for_new_record() -> void:
	stop() 
	if timeInSeconds < bestTime:
		bestTime = timeInSeconds
		update_label(best_label, bestTime)
		print("New Record!")

func _on_timer_timeout() -> void:
	timeInSeconds += 1
	#print("TIMEOUT FIRED ", timeInSeconds)
	var minutes = timeInSeconds / 60
	var seconds = timeInSeconds % 60
	update_label(label, timeInSeconds)
	
	label.text = "%02d:%02d" % [minutes, seconds]
	#print("Label text set to", label.text)
	
func reset() -> void:
	timeInSeconds = 0
	label.text = "00:00"
	start()
