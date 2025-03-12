extends Area2D
class_name ConsistantAttackComponent

@export var damage := 10


func _ready() -> void:
	visible = false
	monitoring = false

func attack():
	visible = true
	monitoring = true





func _on_area_entered(area:HitboxComponent) -> void:
	area.damage(damage)
