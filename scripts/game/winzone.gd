extends Area2D
@onready var panel = get_node("/root/Game/Character/Camera2D/UI/Panel")
@onready var box = get_node("/root/Game/Character/Camera2D/UI/Panel/BoxContainer")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == %Character:
		get_tree().paused = true
		panel.visible = true
		box.visible = true
		
	
