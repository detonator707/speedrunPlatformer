extends Node

@onready var doubleJump = load("res://Scenes/perks/doubleJump.tscn")

var perkList = [doubleJump]

func _ready() -> void:
	#for perk in perkList:
		#ideally we would first randomize it
	var insta = doubleJump.instantiate()
	%BoxContainer.get_child(0).add_child(insta)
