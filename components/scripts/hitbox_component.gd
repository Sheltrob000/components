extends Area2D
class_name HitboxComponent

@export var healthComponent: HealthComponent
@export var hitCooldown : float
signal hasBeenHit(x, y)


func _ready():
	$Timer.wait_time = hitCooldown


func damage(attack: Attack):
	if healthComponent:
		healthComponent.damage(attack.damage)
		hasBeenHit.emit(attack.attackposition.x, attack.attackposition.y)
		monitoring = false
		$Timer.start()
		
	


func _on_timer_timeout() -> void:
	monitoring = true
