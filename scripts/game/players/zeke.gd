extends Node2D
@onready var panel = get_node("/root/Game/Character/Camera2D/UI/Panel2")
@onready var box = get_node("/root/Game/Character/Camera2D/UI/Panel2/BoxContainer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	panel.visible = false
	box.visible = false 
