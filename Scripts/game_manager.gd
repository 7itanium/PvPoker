extends Node

var p1_Cards = 0
var p2_Cards = 0

@onready var card_1: Sprite2D = $"../P1 Cards/Card 1"
@onready var card_2: Sprite2D = $"../P1 Cards/Card 2"
@onready var card_3: Sprite2D = $"../P1 Cards/Card 3"
@onready var card_4: Sprite2D = $"../P1 Cards/Card 4"
@onready var card_5: Sprite2D = $"../P1 Cards/Card 5"

@onready var trash: Button = $Trash
@onready var discard: Sprite2D = $Discard
@onready var flip_sound: AudioStreamPlayer2D = $FlipSound
@onready var hand_value: Label = $HandValue


var base_deck = {
	"AS": [1, "Spade", "res://Sprites/Cards/Spades/ace.png"],
	"AD": [1, "Diamond", "res://Sprites/Cards/Diamonds/ace.png"],
	"AH": [1, "Heart", "res://Sprites/Cards/Hearts/ace.png"],
	"AC": [1, "Club", "res://Sprites/Cards/Clubs/ace.png"],
	"2S": [2, "Spade", "res://Sprites/Cards/Spades/two.png"],
	"2D": [2, "Diamond", "res://Sprites/Cards/Diamonds/two.png"],
	"2H": [2, "Heart", "res://Sprites/Cards/Hearts/two.png"],
	"2C": [2, "Club", "res://Sprites/Cards/Clubs/two.png"],
	"3S": [3, "Spade", "res://Sprites/Cards/Spades/three.png"],
	"3D": [3, "Diamond", "res://Sprites/Cards/Diamonds/three.png"],
	"3H": [3, "Heart", "res://Sprites/Cards/Hearts/three.png"],
	"3C": [3, "Club", "res://Sprites/Cards/Clubs/three.png"],
	"4S": [4, "Spade", "res://Sprites/Cards/Spades/four.png"],
	"4D": [4, "Diamond", "res://Sprites/Cards/Diamonds/four.png"],
	"4H": [4, "Heart", "res://Sprites/Cards/Hearts/four.png"],
	"4C": [4, "Club", "res://Sprites/Cards/Clubs/four.png"],
	"5S": [5, "Spade", "res://Sprites/Cards/Spades/five.png"],
	"5D": [5, "Diamond", "res://Sprites/Cards/Diamonds/five.png"],
	"5H": [5, "Heart", "res://Sprites/Cards/Hearts/five.png"],
	"5C": [5, "Club", "res://Sprites/Cards/Clubs/five.png"],
	"6S": [6, "Spade", "res://Sprites/Cards/Spades/six.png"],
	"6D": [6, "Diamond", "res://Sprites/Cards/Diamonds/six.png"],
	"6H": [6, "Heart", "res://Sprites/Cards/Hearts/six.png"],
	"6C": [6, "Club", "res://Sprites/Cards/Clubs/six.png"],
	"7S": [7, "Spade", "res://Sprites/Cards/Spades/seven.png"],
	"7D": [7, "Diamond", "res://Sprites/Cards/Diamonds/seven.png"],
	"7H": [7, "Heart", "res://Sprites/Cards/Hearts/seven.png"],
	"7C": [7, "Club", "res://Sprites/Cards/Clubs/seven.png"],
	"8S": [8, "Spade", "res://Sprites/Cards/Spades/eight.png"],
	"8D": [8, "Diamond", "res://Sprites/Cards/Diamonds/eight.png"],
	"8H": [8, "Heart", "res://Sprites/Cards/Hearts/eight.png"],
	"8C": [8, "Club", "res://Sprites/Cards/Clubs/eight.png"],
	"9S": [9, "Spade", "res://Sprites/Cards/Spades/nine.png"],
	"9D": [9, "Diamond", "res://Sprites/Cards/Diamonds/nine.png"],
	"9H": [9, "Heart", "res://Sprites/Cards/Hearts/nine.png"],
	"9C": [9, "Club", "res://Sprites/Cards/Clubs/nine.png"],
	"10S": [10, "Spade", "res://Sprites/Cards/Spades/ten.png"],
	"10D": [10, "Diamond", "res://Sprites/Cards/Diamonds/ten.png"],
	"10H": [10, "Heart", "res://Sprites/Cards/Hearts/ten.png"],
	"10C": [10, "Club", "res://Sprites/Cards/Clubs/ten.png"],
	"JS": [11, "Spade", "res://Sprites/Cards/Spades/jack.png"],
	"JD": [11, "Diamond", "res://Sprites/Cards/Diamonds/jack.png"],
	"JH": [11, "Heart", "res://Sprites/Cards/Hearts/jack.png"],
	"JC": [11, "Club", "res://Sprites/Cards/Clubs/jack.png"],
	"QS": [12, "Spade", "res://Sprites/Cards/Spades/queen.png"],
	"QD": [12, "Diamond", "res://Sprites/Cards/Diamonds/queen.png"],
	"QH": [12, "Heart", "res://Sprites/Cards/Hearts/queen.png"],
	"QC": [12, "Club", "res://Sprites/Cards/Clubs/queen.png"],
	"KS": [13, "Spade", "res://Sprites/Cards/Spades/king.png"],
	"KD": [13, "Diamond", "res://Sprites/Cards/Diamonds/king.png"],
	"KH": [13, "Heart", "res://Sprites/Cards/Hearts/king.png"],
	"KC": [13, "Club", "res://Sprites/Cards/Clubs/king.png"]
}

var deck = base_deck
var cards = deck.keys()
var card = []
var offsets = [-400, -200, 0, 200, 400]
var hand = []
var values = []
var suits = []
var handValue = ["None", 0]
var rerolls = 0
var discard_texture = " "

func _ready():
	discard.position = Vector2(-750,0)
	discard.target_position = Vector2(-750,0)
	
	discard.texture = load(discard_texture)
	
	rerolls = 0
	card = [card_1, card_2, card_3, card_4, card_5]
	offsets = [-400, -200, 0, 200, 400]
	await get_tree().create_timer(.25).timeout
	
	for i in range(card.size()):
		card[i].target_position = Vector2(offsets[i], 275)
		card[i].flipped = 0
		flip_sound.play()
		await get_tree().create_timer(.1).timeout
	
	check_hand()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	if rerolls == 3:
		for i in range(card.size()):
			if card[i].trash == true:
				card[i].target_position.y -= 25
				card[i].trash = false

func _on_trash_pressed() -> void:
	rerolls += 1
	trash.disabled = true
	card = [card_1, card_2, card_3, card_4, card_5]
	offsets = [-400, -200, 0, 200, 400]
	
	flip_sound.play()
	
	for i in range(card.size()):
		if card[i].trash == true:
			card[i].trashing = true
			card[i].trash = false
			card[i].target_position = Vector2(-750, 0)
			
	
	await get_tree().create_timer(1.5).timeout
	
	
	for i in range(card.size()):
		if card[i].trashing == true:
			card[i].position = Vector2(0, 0)
			card[i].target_position = Vector2(offsets[i], 275)
			card[i].flipped = 0
			discard.texture = card[i].texture
			card[i].trashing = false
			flip_sound.play()
			await get_tree().create_timer(.1).timeout
	check_hand()
	if rerolls == 3:
		await get_tree().create_timer(3).timeout
		for i in range(card.size()):
			card[i].target_position = Vector2(0, 0)
		discard.target_position = Vector2(0, 0)
		await get_tree().create_timer(1.5).timeout
		_ready()

	trash.disabled = false

func check_hand():
	values = [card_1.cardNum, card_2.cardNum, card_3.cardNum, card_4.cardNum, card_5.cardNum]
	values.sort()
	var straightCheck = [values[0], values[1] - 1, values[2] - 2, values[3] - 3, values[4] - 4]
	suits = [card_1.cardSuit, card_2.cardSuit, card_3.cardSuit, card_4.cardSuit, card_5.cardSuit]
	var matches = 0
	var siblings = 0
	
	for item in values:
		if values.count(item) > 1:
			siblings += 1
		if values.count(item) >= matches:
			matches = values.count(item)
	
	var flush = suits.all(func(e): return e == suits.front())
	var straight = straightCheck.all(func(e): return e == straightCheck.front())
	
	if 1 in values and 13 in values and 12 in values and 11 in values and 10 in values:
		if flush == true:
			handValue = ["Royal Flush", 50]
		else:
			handValue = ["Straight", 20]
	elif straight == true:
		if flush == true:
			handValue = ["Straight Flush", 40]
		else:
			handValue = ["Straight", 20]
	elif flush == true:
		handValue = ["Flush", 25]
	elif matches == 4:
		handValue = ["Four of a Kind", 35]
	elif matches == 3:
		if siblings == 5:
			handValue = ["Full House", 30]
		else:
			handValue = ["Three of a Kind", 15]
	elif matches == 2:
		if siblings == 4:
			handValue = ["Two Pair", 10]
		else:
			handValue = ["Pair", 5]
	else:
		handValue = ["None", 0]
	
	hand_value.text = handValue[0] + " - " + str(handValue[1]) + " dmg"
