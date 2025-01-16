extends Sprite2D

var target_position = Vector2(0, 275)  # Target position
var speed = 5.0  # Adjust this to control the movement speed
var flipped = 0
var trash = false

@onready var game_manager: Node = %"Game Manager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0, 0)  # Start at (0, 0).
	print(game_manager.p1_Cards)
	
	var dynamic_path = "res://Sprites/Cards/back.png"
	texture = load(dynamic_path)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_viewport_rect().has_point(to_local(event.position)):
			match trash:
				false:
					trash = true
					target_position.y += 25
				true:
					trash = false
					target_position.y -= 25

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if game_manager.p1_Cards >= 3:
		position.x = lerp(position.x, target_position.x, speed * delta)
		position.y = lerp(position.y, target_position.y, speed * delta)
		
		if flipped == 0:
			var card = game_manager.deck[game_manager.cards[randi() % game_manager.cards.size()]]
			var dynamic_path = card[1]
			texture = load(dynamic_path)
			flipped = 1

		# Optional: Snap to the target position when close enough
		if position.distance_to(target_position) < 1:
			position = target_position
