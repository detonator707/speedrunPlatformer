extends Node2D

@onready var character = get_node("/root/Game/Character")
@onready var perklist = get_node("Character/Camera2D/UI/Panel/BoxContainer")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/AnimatedSprite2D.play("default")


func _on_button_pressed() -> void:
	character.enable_double_jump()
	character.back_to_start()
	%BoxContainer.visibility = false
	
	
