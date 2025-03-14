extends Area2D
class_name AttackComponent

@export var damage := 10
@export var attackTimer := 1.0
@export var cooldown := 1.0
@export var knockbackForce :=0

var canAttack := true

func _ready() -> void:
	$attackLength.wait_time = attackTimer
	$cooldown.wait_time = cooldown
	visible = false
	monitoring = false

func attack():
	if canAttack:
		visible = true
		monitoring = true
		$attackLength.start()
		$cooldown.start()
		canAttack = false

func _on_area_entered(area: HitboxComponent) -> void:
	var attack = Attack.new()
	attack.damage = damage
	attack.knockbackForce = knockbackForce
	attack.attackposition = Vector2(global_position.x, global_position.y)
	area.damage(attack)


func _on_attack_length_timeout() -> void:
	visible = false
	monitoring = false


func _on_cooldown_timeout() -> void:
	canAttack = true
