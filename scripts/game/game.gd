extends Node

@onready var doubleJump = load("res://Scenes/perks/doubleJump.tscn")
@onready var dash = load("res://Scenes/perks/Dash.tscn")

@onready var perkList: Array[PackedScene] = [doubleJump, dash]

func _ready() -> void:
	perkList.shuffle()
	
	var insta = perkList[0].instantiate()
	%BoxContainer.get_child(0).add_child(insta)
	var insta1 = perkList[1].instantiate()
	%BoxContainer.get_child(1).add_child(insta1)
