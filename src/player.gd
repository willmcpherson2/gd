extends CharacterBody2D

const SPEED: float = 10000

var target: Vector2 = Vector2()

func _ready() -> void:
	position = Vector2(0, 0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _process(delta: float) -> void:
	var direction: Vector2 = position.direction_to(target)
	velocity = direction * SPEED * delta
	if position.distance_to(target) > 10:
		move_and_slide()
	else:
		velocity = Vector2(0, 0)
