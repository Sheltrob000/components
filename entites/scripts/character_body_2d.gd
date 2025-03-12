extends CharacterBody2D

const SPEED = 30000.0
const JUMP_VELOCITY = -70000.0
const DASH_VELOCITY = 50000.0

var attackdirection = 1

func _ready() -> void:
	$UI.setHealth($HealthComponent.health)
	
	

func _physics_process(delta: float) -> void:

	$UI.setHealth($HealthComponent.health)
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		attackdirection = direction

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * delta
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0

	if Input.is_action_just_pressed("attack"):
		if attackdirection == 1:
			$attackRight.attack()
		else:
			$AttackLeft.attack()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	velocity.x = SPEED * direction * delta
	move_and_slide()
