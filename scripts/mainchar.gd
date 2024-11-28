extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

@onready var player = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vertical_direction := Input.get_axis("move_up", "move_down")
	
	velocity.y = vertical_direction * SPEED
	if vertical_direction > 0:
		player.play("move-down")
	elif vertical_direction < 0:
			player.play("move-up")
	
		
	var horizontal_direction := Input.get_axis("move_left", "move_right")
	
	velocity.x = horizontal_direction * SPEED
	if horizontal_direction > 0:
		player.play("move-right")
	elif horizontal_direction < 0:
		player.play("move-left")
		
	if !horizontal_direction && !vertical_direction:	
		velocity.x = move_toward(velocity.x, 0, SPEED)
		player.play("idle-phone")
		

	move_and_slide()
	
	
