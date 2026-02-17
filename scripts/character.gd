extends CharacterBody2D

@onready var animSprite = get_node("AnimatedSprite2D")

var prevAnimation = ""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var has_double_jump := false
@export var extra_jumps := 0
var jumps_left := 0

func enable_double_jump(amount := 1) -> void:
	has_double_jump = true
	extra_jumps += amount
	jumps_left = extra_jumps


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction := Input.get_axis("left", "right")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			animSprite.play("jump")
			velocity.y = JUMP_VELOCITY
			jumps_left = extra_jumps
		elif has_double_jump && jumps_left > 0:
			animSprite.play("jump")
			velocity.y = JUMP_VELOCITY
			jumps_left -= 1
			
	if Input.is_action_just_pressed("dash"):
		direction = 2000
		move_and_slide()


	if not is_on_floor():
		animSprite.play("jump")
		prevAnimation = "jump"
	elif direction == 0:
		animSprite.play("idle")
		prevAnimation = "idle"
	else:
		if prevAnimation != "run":
			animSprite.play("runTransform")
		else:
			print("temp")
		if direction == 1:
			if(animSprite.scale.x < -.5):
				animSprite.position.x = 7
				animSprite.scale.x *= -1
		else:
			if(animSprite.scale.x > -.5):
				animSprite.position.x = -7
				animSprite.scale.x *= -1
	
	if is_on_floor():
		jumps_left = extra_jumps
		
	# Get the input direction and handle the movement/deceleration.da
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
