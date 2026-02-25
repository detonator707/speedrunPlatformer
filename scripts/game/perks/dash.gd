extends Node2D

@onready var character = get_node("/root/Game/Character")
@onready var perkList = get_node("/root/Game/Character/Camera2D/UI")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/AnimatedSprite2D.play("default")


func _on_button_pressed() -> void:
	character.enable_dash()
	character.back_to_start()
	perkList.visible = false
	get_tree().paused = false
