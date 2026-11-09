extends Node2D

var exiting = false

func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not exiting:
		exiting = true
		$DoorSound.play()
		await $DoorSound.finished
		get_tree().call_deferred(
			"change_scene_to_file",
			"res://Scenes/level_2.tscn"
		)
