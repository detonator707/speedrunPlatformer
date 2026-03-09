extends Node

#perks
@onready var doubleJump = load("res://Scenes/perks/doubleJump.tscn")
@onready var characterlist = get_node("/root/Game/Character/Camera2D/UI/Panel2/BoxContainer")
@onready var dash = load("res://Scenes/perks/Dash.tscn")
@onready var finn = load("res://Scenes/dolphin.tscn")
@onready var peng = load("res://Scenes/penguin.tscn")
@onready var dog = load("res://Scenes/zeke.tscn")
@onready var mush = load("res://Scenes/mush.tscn")
@onready var perkList: Array[PackedScene] = [doubleJump, dash]
@onready var characters: Array[PackedScene] = [finn,dog,peng,mush]

#obstacles
@onready var fog = load("res://Scenes/obstacles/fog.tscn")

@onready var obstacleList: Array[PackedScene] = [fog]
@onready var usedList: Array[PackedScene] = []
var roundOver: bool = false: 
	set(value):
		roundOver = value
		if(roundOver == true):
			var location = randi() % obstacleList.size()
			var insta = obstacleList[location].instantiate()
			if usedList.has(obstacleList[location]):
				#print("list has it")
				if(obstacleList[location] == fog):
					#print("BALLSSSSS")
					var child_node = $%Camera2D/fog
					child_node.get_child(0).oneMore()
			else:
				#print("making a new one")
				%Camera2D.add_child(insta)
				usedList.append(obstacleList[location])
	get():
		return roundOver


func getRound():
	return roundOver

func _ready() -> void:
	perkList.shuffle()
	var finn2 = characters[0].instantiate()
	var dog2 = characters[1].instantiate()
	var peng2 = characters[2].instantiate()
	var mush2 = characters[3].instantiate()

	characterlist.get_child(0).add_child(finn2)
	characterlist.get_child(1).add_child(peng2)
	characterlist.get_child(2).add_child(dog2)
	characterlist.get_child(3).add_child(mush2)
	
	
	var insta = perkList[0].instantiate()
	%BoxContainer.get_child(0).add_child(insta)
	var insta1 = perkList[1].instantiate()
	%BoxContainer.get_child(1).add_child(insta1)
