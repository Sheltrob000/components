extends CharacterBody2D

const SPEED = 700.0
const JUMP_VELOCITY = -1350.0
const DASH_VELOCITY = 700.0
const ACCERLATION = 100

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
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0

	if Input.is_action_just_pressed("attack"):
		if attackdirection == 1:
			$attackRight.attack()
		else:
			$AttackLeft.attack()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCERLATION)
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, ACCERLATION)

	if abs(velocity.x) >= SPEED:
		pass

	move_and_slide()


func _on_hitbox_component_has_been_hit(x, y) -> void:

	var knockbacky = (global_position.y - y) * 10
	print(knockbacky)
	velocity.y += knockbacky - 1000

	var knockbackx = (global_position.x - x) * 20
	velocity.x += knockbackx
