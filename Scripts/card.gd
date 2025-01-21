extends Sprite2D

var target_position = Vector2(0, 0)  # Target position
const SPEED = 5.0  # Adjust this to control the movement speed
var flipped = 0
var trash = false

@onready var game_manager: Node = %"Game Manager"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0, 0)  # Start at (0, 0).
	
	var card_back = "res://Sprites/Cards/back.png"
	texture = load(card_back)


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	position.x = lerp(position.x, target_position.x, SPEED * delta)
	position.y = lerp(position.y, target_position.y, SPEED * delta)
	
	if flipped == 0:
		var card = game_manager.deck[game_manager.cards[randi() % game_manager.cards.size()]]
		var dynamic_path = card[1]
		texture = load(dynamic_path)
		flipped = 1

	# Optional: Snap to the target position when close enough
	if position.distance_to(target_position) < 1:
		position = target_position
