extends Node2D

@onready var character = get_node("/root/Game/Character")
@onready var panel = get_node("/root/Game/Character/Camera2D/UI/Panel")
@onready var box = get_node("/root/Game/Character/Camera2D/UI/Panel/BoxContainer")
@onready var timer = get_node("/root/Game/Character/Camera2D/UI/Label/Timer")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/AnimatedSprite2D.play("default")


func _on_button_pressed() -> void:
	character.enable_dash()
	character.back_to_start()
	timer.start()
	get_node("/root/Game").roundOver = true
	panel.visible = false
	box.visible = false
	get_tree().paused = false
