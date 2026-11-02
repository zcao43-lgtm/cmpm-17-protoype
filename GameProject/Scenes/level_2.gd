
extends Node2D

func _on_exit_body_entered(body):
	if body.name == "Player":
		if body.has_key:
			get_tree().call_deferred(
				"change_scene_to_file",
                "res://Scenes/level_3.tscn"
			)
		else:
			print("You need a key!")
