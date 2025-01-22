extends Sprite2D

var target_position = Vector2(-750, 0)  # Target position
const SPEED = 5.0  # Adjust this to control the movement speed

@onready var game_manager: Node = %"Game Manager"

func _process(delta: float) -> void:
	position.x = lerp(position.x, target_position.x, SPEED * delta)
	position.y = lerp(position.y, target_position.y, SPEED * delta)

	# Optional: Snap to the target position when close enough
	if position.distance_to(target_position) < 1:
		position = target_position
