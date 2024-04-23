extends Node2D

@export var arrow_delay = 0.0
@export var arrow_interval = 0.0

var arrow_scene = preload("res://scenes/arrow.tscn")

func _ready():
	await get_tree().create_timer(arrow_delay).timeout
	$AnimationPlayer.play("arrow_trigger")
	shoot()

func _on_animation_player_animation_finished(arrow_trigger):
	await get_tree().create_timer(arrow_interval).timeout
	$AnimationPlayer.play("arrow_trigger")
	shoot()
	
func shoot():
	var arrow = arrow_scene.instantiate()
	arrow.dir = rotation
	arrow.spawnPos = global_position
	arrow.spawnRot = rotation
