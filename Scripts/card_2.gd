extends Sprite2D

var target_position = Vector2(-200, 275)  # Target position
var speed = 5.0  # Adjust this to control the movement speed

@onready var game_manager: Node = %"Game Manager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0, 0)  # Start at (0, 0).
	print(game_manager.p1_Cards)


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if game_manager.p1_Cards >= 2:
		position.x = lerp(position.x, target_position.x, speed * delta)
		position.y = lerp(position.y, target_position.y, speed * delta)
		
		var dynamic_path = "res://Sprites/Cards/Hearts/ten.png"
		texture = load(dynamic_path)

		# Optional: Snap to the target position when close enough
		if position.distance_to(target_position) < 1:
			position = target_position
