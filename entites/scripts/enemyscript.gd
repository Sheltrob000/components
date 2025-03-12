extends CharacterBody2D


const SPEED = 10000
const JUMP_VELOCITY = -400.0

var direction = -1






func _physics_process(delta: float) -> void:
	## Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = direction * SPEED * delta	
		
	if (!$floorLeft.is_colliding() or !$floorRight.is_colliding()):
		velocity.x *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
	

	if velocity.x == 0:
		velocity.x = direction * SPEED * delta	
	
	$ConsistintAttackComponent.attack()

	move_and_slide()
