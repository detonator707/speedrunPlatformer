extends CharacterBody2D

@onready var animSprite = get_node("AnimatedSprite2D")

var sprite = ""
var prevAnimation = ""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var has_dash := false
@export var extra_dashes := 0
@export var has_double_jump := false
@export var extra_jumps := 0
var jumps_left := 0
var canRotate = true

func enable_double_jump(amount := 1) -> void:
	has_double_jump = true
	extra_jumps += amount
	jumps_left = extra_jumps
	
func enable_dash(amount := 1)-> void:
	has_dash = true
	extra_dashes += amount
	

func back_to_start() -> void:
	global_transform.origin = Vector2(-1224.0,-40.0)


func _physics_process(delta: float) -> void:
	if(animSprite.position.x != 0 && sprite != ""):
		animSprite.position.x = 0
		animSprite.position.y = 0
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction := Input.get_axis("left", "right")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			if(sprite == ""):
				animSprite.play("jump")
			else:
				animSprite.play("guinJump")
			velocity.y = JUMP_VELOCITY
			jumps_left = extra_jumps
		elif has_double_jump && jumps_left > 0:
			if(sprite == ""):
				animSprite.play("jump")
			else:
				animSprite.play("guinJump")
			velocity.y = JUMP_VELOCITY
			jumps_left -= 1
			
	if Input.is_action_just_pressed("dash"):
		if has_dash:
			if direction < 0:
				direction = -20
			elif direction > 0:
				direction = 20
			move_and_slide()


	if not is_on_floor():
		if(prevAnimation != "jump" && prevAnimation != "idle" && sprite == ""):
			animSprite.play("runTransformBackwards")
			prevAnimation = "runTransformBackwardsJ"
		else:
			if(sprite == ""):
				animSprite.play("jump")
			else:
				animSprite.play("guinJump")
	elif direction == 0:
		if(prevAnimation != "idle" && sprite == ""):
			animSprite.play("runTransformBackwards")
			prevAnimation = "runTransformBackwardsI"
		else:
			if(sprite == ""):
				animSprite.play("idle")
			else:
				animSprite.play("penguinIdle")
				animSprite.rotation = 0.0
	else:
		if(prevAnimation != "run" && sprite == ""):
			animSprite.play("runTransform")
			prevAnimation = "runTransform"
		else:
			if(sprite == ""):
				animSprite.play("run")
			else:
				animSprite.play("penguinIdle")
				print(animSprite.rotation)
				if(animSprite.rotation > 0 && canRotate):
					print("flipping right")
					animSprite.rotation = -.20
					canRotate = false
				elif(canRotate):
					print("flipping left")
					animSprite.rotation = .20
					canRotate = false
		if direction == 1:
			if(animSprite.scale.x < -.5 && sprite == ""):
				animSprite.position.x = 7
				animSprite.scale.x *= -1
			elif(animSprite.scale.x < -.5):
				animSprite.scale.x *= -1
		else:
			if(animSprite.scale.x > -.5 && sprite == ""):
				animSprite.position.x = -7
				animSprite.scale.x *= -1
			elif animSprite.scale.x > -.5:
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


func _on_animated_sprite_2d_animation_finished() -> void:
	if(sprite == ""):
		if(animSprite.animation == "runTransform"):
			animSprite.play("run")
			prevAnimation = "run"
		elif(prevAnimation == "runTransformBackwardsI"):
			animSprite.play("idle")
			prevAnimation = "idle"
		elif(prevAnimation == "runTransformBackwardsJ"):
			animSprite.play("jump")
			prevAnimation = "jump"


func _on_timer_timeout() -> void:
	canRotate = true
