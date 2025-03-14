extends Area2D
class_name ConsistantAttackComponent

@export var damage := 10
@export var knockbackForce :=0


func _ready() -> void:
	visible = false
	monitoring = false

func attack():
	visible = true
	monitoring = true





func _on_area_entered(area:HitboxComponent) -> void:
		var attack = Attack.new()
		attack.damage = damage
		attack.knockbackForce = knockbackForce
		attack.attackposition = Vector2(global_position.x, global_position.y)
		area.damage(attack)
