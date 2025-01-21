extends Node

var p1_Cards = 0
var p2_Cards = 0

@onready var card_1: Sprite2D = $"../P1 Cards/Card 1"
@onready var card_2: Sprite2D = $"../P1 Cards/Card 2"
@onready var card_3: Sprite2D = $"../P1 Cards/Card 3"
@onready var card_4: Sprite2D = $"../P1 Cards/Card 4"
@onready var card_5: Sprite2D = $"../P1 Cards/Card 5"

var base_deck = {
	"AS": [1, "res://Sprites/Cards/Spades/ace.png"],
	"AD": [1, "res://Sprites/Cards/Diamonds/ace.png"],
	"AH": [1, "res://Sprites/Cards/Hearts/ace.png"],
	"AC": [1, "res://Sprites/Cards/Clubs/ace.png"],
	"2S": [2, "res://Sprites/Cards/Spades/two.png"],
	"2D": [2, "res://Sprites/Cards/Diamonds/two.png"],
	"2H": [2, "res://Sprites/Cards/Hearts/two.png"],
	"2C": [2, "res://Sprites/Cards/Clubs/two.png"],
	"3S": [3, "res://Sprites/Cards/Spades/three.png"],
	"3D": [3, "res://Sprites/Cards/Diamonds/three.png"],
	"3H": [3, "res://Sprites/Cards/Hearts/three.png"],
	"3C": [3, "res://Sprites/Cards/Clubs/three.png"],
	"4S": [4, "res://Sprites/Cards/Spades/four.png"],
	"4D": [4, "res://Sprites/Cards/Diamonds/four.png"],
	"4H": [4, "res://Sprites/Cards/Hearts/four.png"],
	"4C": [4, "res://Sprites/Cards/Clubs/four.png"],
	"5S": [5, "res://Sprites/Cards/Spades/five.png"],
	"5D": [5, "res://Sprites/Cards/Diamonds/five.png"],
	"5H": [5, "res://Sprites/Cards/Hearts/five.png"],
	"5C": [5, "res://Sprites/Cards/Clubs/five.png"],
	"6S": [6, "res://Sprites/Cards/Spades/six.png"],
	"6D": [6, "res://Sprites/Cards/Diamonds/six.png"],
	"6H": [6, "res://Sprites/Cards/Hearts/six.png"],
	"6C": [6, "res://Sprites/Cards/Clubs/six.png"],
	"7S": [7, "res://Sprites/Cards/Spades/seven.png"],
	"7D": [7, "res://Sprites/Cards/Diamonds/seven.png"],
	"7H": [7, "res://Sprites/Cards/Hearts/seven.png"],
	"7C": [7, "res://Sprites/Cards/Clubs/seven.png"],
	"8S": [8, "res://Sprites/Cards/Spades/eight.png"],
	"8D": [8, "res://Sprites/Cards/Diamonds/eight.png"],
	"8H": [8, "res://Sprites/Cards/Hearts/eight.png"],
	"8C": [8, "res://Sprites/Cards/Clubs/eight.png"],
	"9S": [9, "res://Sprites/Cards/Spades/nine.png"],
	"9D": [9, "res://Sprites/Cards/Diamonds/nine.png"],
	"9H": [9, "res://Sprites/Cards/Hearts/nine.png"],
	"9C": [9, "res://Sprites/Cards/Clubs/nine.png"],
	"10S": [10, "res://Sprites/Cards/Spades/ten.png"],
	"10D": [10, "res://Sprites/Cards/Diamonds/ten.png"],
	"10H": [10, "res://Sprites/Cards/Hearts/ten.png"],
	"10C": [10, "res://Sprites/Cards/Clubs/ten.png"],
	"JS": [10, "res://Sprites/Cards/Spades/jack.png"],
	"JD": [10, "res://Sprites/Cards/Diamonds/jack.png"],
	"JH": [10, "res://Sprites/Cards/Hearts/jack.png"],
	"JC": [10, "res://Sprites/Cards/Clubs/jack.png"],
	"QS": [10, "res://Sprites/Cards/Spades/queen.png"],
	"QD": [10, "res://Sprites/Cards/Diamonds/queen.png"],
	"QH": [10, "res://Sprites/Cards/Hearts/queen.png"],
	"QC": [10, "res://Sprites/Cards/Clubs/queen.png"],
	"KS": [10, "res://Sprites/Cards/Spades/king.png"],
	"KD": [10, "res://Sprites/Cards/Diamonds/king.png"],
	"KH": [10, "res://Sprites/Cards/Hearts/king.png"],
	"KC": [10, "res://Sprites/Cards/Clubs/king.png"],
	
}

var deck = base_deck

var cards = deck.keys()	


func _ready():
	await get_tree().create_timer(1).timeout
	card_1.target_position = Vector2(-400, 275)
	await get_tree().create_timer(.1).timeout
	card_2.target_position = Vector2(-200, 275)
	await get_tree().create_timer(.1).timeout
	card_3.target_position = Vector2(0, 275)
	await get_tree().create_timer(.1).timeout
	card_4.target_position = Vector2(200, 275)
	await get_tree().create_timer(.1).timeout
	card_5.target_position = Vector2(400, 275)

	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
