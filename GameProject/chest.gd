extends Area2D

var player_near = false
var opened = false

@onready var closed_sprite = $ClosedSprite
@onready var open_sprite = $OpenSprite

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	closed_sprite.visible = true
	open_sprite.visible = false

func _process(_delta):
	if player_near and Input.is_key_pressed(KEY_E) and not opened:
		open_chest()

func _on_body_entered(body):
	if body.name == "Player":
		player_near = true

func _on_body_exited(body):
	if body.name == "Player":
		player_near = false

func open_chest():
	opened = true
	closed_sprite.visible = false
	open_sprite.visible = true
	print("Chest opened!")
