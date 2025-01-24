extends Sprite2D

@onready var discarded_1: Sprite2D = $"Cards/Discarded 1"
@onready var discarded_2: Sprite2D = $"Cards/Discarded 2"
@onready var discarded_3: Sprite2D = $"Cards/Discarded 3"
@onready var discarded_4: Sprite2D = $"Cards/Discarded 4"
@onready var discarded_5: Sprite2D = $"Cards/Discarded 5"
@onready var discarded_6: Sprite2D = $"Cards/Discarded 6"
@onready var discarded_7: Sprite2D = $"Cards/Discarded 7"
@onready var discarded_8: Sprite2D = $"Cards/Discarded 8"
@onready var discarded_9: Sprite2D = $"Cards/Discarded 9"
@onready var discarded_10: Sprite2D = $"Cards/Discarded 10"
@onready var discarded_11: Sprite2D = $"Cards/Discarded 11"
@onready var discarded_12: Sprite2D = $"Cards/Discarded 12"
@onready var discarded_13: Sprite2D = $"Cards/Discarded 13"
@onready var discarded_14: Sprite2D = $"Cards/Discarded 14"
@onready var discarded_15: Sprite2D = $"Cards/Discarded 15"
@onready var discarded_16: Sprite2D = $"Cards/Discarded 16"
@onready var discarded_17: Sprite2D = $"Cards/Discarded 17"
@onready var discarded_18: Sprite2D = $"Cards/Discarded 18"
@onready var discarded_19: Sprite2D = $"Cards/Discarded 19"
@onready var discarded_20: Sprite2D = $"Cards/Discarded 20"
@onready var game_manager: Node = %"Game Manager"

var target_position = Vector2(-1160, 0)  # Target position
const SPEED = 5.0
var discarded = []

var card_textures = []

func _process(delta: float) -> void:
	discarded = [discarded_1,discarded_11,discarded_2,discarded_12,discarded_3,discarded_13,discarded_4,discarded_14,discarded_5,discarded_15,discarded_6,discarded_16,discarded_7,discarded_17,discarded_8,discarded_18,discarded_9,discarded_19,discarded_10,discarded_20]
	
	var discards = len(card_textures)
	if discards > 20:
		discards = 20
		
	for i in range(discards):
		discarded[i].texture = load(card_textures[i])
		
	position.x = lerp(position.x, target_position.x, SPEED * delta)
	position.y = lerp(position.y, target_position.y, SPEED * delta)

	if position.distance_to(target_position) < 1:
		position = target_position

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				target_position.x = -1160
