extends Area2D
class_name HitboxComponent

@export var healthComponent: HealthComponent


func damage(damage : int):
	if healthComponent:
		healthComponent.damage(damage)
		
	
