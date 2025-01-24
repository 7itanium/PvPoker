extends Sprite2D

var target_position = Vector2(0, 0)  # Target position
const SPEED = 5.0  # Adjust this to control the movement speed
var trash = false
var trashing = false

var cardNum = 0
var cardSuit = "Back"
var dynamic_path = "res://Sprites/Cards/back.png"

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

	if position.distance_to(target_position) < 1:
		position = target_position


func _input(event):
	if trashing == false:
		if game_manager.in_game == true:
			if event is InputEventMouseButton:
				if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
					if is_pixel_opaque(get_local_mouse_position()):
						if trash == false:
							target_position.y += 25
							trash = true
						elif trash == true:
							target_position.y -= 25
							trash = false

func button_select():
	if trash == false:
		target_position.y += 25
		trash = true
	elif trash == true:
		target_position.y -= 25
		trash = false
