extends Sprite2D

var target_position = Vector2(-750, 0)  # Target position
const SPEED = 5.0  # Adjust this to control the movement speed
var disabled = false

@onready var game_manager: Node = %"Game Manager"
@onready var trash: Sprite2D = $"../../Trash UI/Trash"

func _process(delta: float) -> void:
	position.x = lerp(position.x, target_position.x, SPEED * delta)
	position.y = lerp(position.y, target_position.y, SPEED * delta)

	# Optional: Snap to the target position when close enough
	if position.distance_to(target_position) < 1:
		position = target_position

func _input(event):
	if disabled == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if is_pixel_opaque(get_local_mouse_position()):
					if trash.position.x != -690:
						trash.target_position.x = -690
