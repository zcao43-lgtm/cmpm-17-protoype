extends CharacterBody2D

var player = null
var player_chase = false


@export var speed: float = 100.0

func _physics_process(delta: float) -> void:
    if player_chase and is_instance_valid(player):
        var direction = global_position.direction_to(player.global_position)
        velocity = direction * speed
        move_and_slide()
    else:
        velocity = Vector2.ZERO



func _on_detection_body_entered(body: Node2D) -> void:
    if body.name == "Player":
        player = body
        player_chase = true
        print("Player detected!")


func _on_detection_body_exited(body: Node2D) -> void:
    if body == player:
        player = null
        player_chase = false
        print("Player left!")
