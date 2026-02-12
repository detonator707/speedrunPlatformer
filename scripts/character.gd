extends CharacterBody2D

@onready var animSprite = get_node("AnimatedSprite2D")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction := Input.get_axis("left", "right")
	# Handle jump.
	if is_on_floor() and Input.is_action_pressed("ui_accept"):
		animSprite.play("jump")
		velocity.y = JUMP_VELOCITY
	elif direction == 0 and is_on_floor():
		animSprite.play("idle")
	else:
		animSprite.play("run")

	# Get the input direction and handle the movement/deceleration.da
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
