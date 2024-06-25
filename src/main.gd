extends Node

func _ready() -> void:
	var player_sprite: Sprite2D = Sprite2D.new()
	player_sprite.texture = load("res://assets/player.png")

	var player_script: Resource = load("res://src/player.gd")

	var player: CharacterBody2D = CharacterBody2D.new()
	player.add_child(player_sprite)
	player.set_script(player_script)

	add_child(player)
