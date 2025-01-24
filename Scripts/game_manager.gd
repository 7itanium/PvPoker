extends Node

@onready var card_1: Sprite2D = $"../P1 Cards/Card 1"
@onready var card_2: Sprite2D = $"../P1 Cards/Card 2"
@onready var card_3: Sprite2D = $"../P1 Cards/Card 3"
@onready var card_4: Sprite2D = $"../P1 Cards/Card 4"
@onready var card_5: Sprite2D = $"../P1 Cards/Card 5"

@onready var card_6: Sprite2D = $"../P2 Cards/Card 1"
@onready var card_7: Sprite2D = $"../P2 Cards/Card 2"
@onready var card_8: Sprite2D = $"../P2 Cards/Card 3"
@onready var card_9: Sprite2D = $"../P2 Cards/Card 4"
@onready var card_10: Sprite2D = $"../P2 Cards/Card 5"


@onready var trash: Button = $Trash
@onready var discard: Sprite2D = $Discard
@onready var flip_sound: AudioStreamPlayer2D = $FlipSound
@onready var p1_hand_value: Label = $HandValue
@onready var p2_hand_value: Label = $HandValue2

@onready var p1_health_bar: ProgressBar = $"../P1 Cards/HealthBar"
@onready var p1_health_text: Label = $"../P1 Cards/HealthBar/HealthText"
@onready var p2_health_bar: ProgressBar = $"../P2 Cards/HealthBar"
@onready var p2_health_text: Label = $"../P2 Cards/HealthBar/HealthText"

@onready var round_marker_1: Sprite2D = $"../Table/Round Marker 1"
@onready var round_marker_2: Sprite2D = $"../Table/Round Marker 2"
@onready var round_marker_3: Sprite2D = $"../Table/Round Marker 3"
@onready var trash_UI: Sprite2D = $"../Trash UI/Trash"




var deck = {
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

var liveDeck = deck.keys()
var p1Hand = []
var p1HandValue = ["None", 0]
var p2HandValue = ["None", 0]
var p2Hand = []
var bothHands = []
var offsets = []
var hand = []
var values = []
var suits = []
var buttons = []
var rerolls = 0
var round_marker_full_texture = "res://Sprites/round_marker_full.png"
var round_marker_empty_texture = "res://Sprites/round_marker_empty.png"
var empty_texture = " "
var p1HP = 100
var p2HP = 100
var p1dmg = 0
var p2dmg = 0
var in_game = true

func _ready():
	p1_hand_value.text = p1HandValue[0] + " - " + str(p1HandValue[1]) + " dmg"
	p2_hand_value.text = p2HandValue[0] + " - " + str(p2HandValue[1]) + " dmg"
	discard.target_position = Vector2(-750,0)
	discard.texture = load(empty_texture)
	
	liveDeck = deck.keys()
	trash_UI.card_textures = []
	for i in range(len(trash_UI.discarded)):
		trash_UI.discarded[i].texture = load(" ")
	
	rerolls = 0
	p1Hand = [card_1, card_2, card_3, card_4, card_5]
	p2Hand = [card_6, card_7, card_8, card_9, card_10]
	offsets = [-400, -200, 0, 200, 400]
	await get_tree().create_timer(.25).timeout
	
	for i in range(0,5):
		choose_card(i, p1Hand)
		choose_card(i, p2Hand)
	
	for i in range(0,5):
		p1Hand[i].target_position = Vector2(offsets[i], 275)
		flip_sound.play()
		p2Hand[i].target_position = Vector2(offsets[i], -275)
		await get_tree().create_timer(.1).timeout
	
	check_hand(p1Hand)
	check_hand(p2Hand)
	p1HandValue = check_hand(p1Hand)
	p1dmg = p1HandValue[1]
	p1_hand_value.text = p1HandValue[0] + " - " + str(p1dmg) + " dmg"
	p2HandValue = check_hand(p2Hand)
	p2dmg = p2HandValue[1]
	p2_hand_value.text = p2HandValue[0] + " - " + str(p2dmg) + " dmg"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("Lock-in"):
		_on_trash_pressed()
	
	if Input.is_action_just_pressed("Trash Open"):
		if rerolls > 0 and trash.disabled == false:
			if trash_UI.target_position.x != -690:
				trash_UI.target_position.x = -690
			else:
				trash_UI.target_position.x = -1160
	
	p1Hand = [card_1, card_2, card_3, card_4, card_5]
	buttons = ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"]
	for i in range(5):
		if Input.is_action_just_pressed(buttons[i]):
			p1Hand[i].button_select()
		
	match rerolls:
		0:
			round_marker_1.texture = load(round_marker_empty_texture)
			round_marker_2.texture = load(round_marker_empty_texture)
			round_marker_3.texture = load(round_marker_empty_texture)
		1:
			round_marker_1.texture = load(round_marker_full_texture)
		2:
			round_marker_2.texture = load(round_marker_full_texture)
		3:
			round_marker_3.texture = load(round_marker_full_texture)
			for i in range(0,5):
				if p1Hand[i].trash == true:
					p1Hand[i].target_position.y -= 25
					p1Hand[i].trash = false
				if p2Hand[i].trash == true:
					p2Hand[i].target_position.y -= 25
					p2Hand[i].trash = false
			
	p1_health_bar.value = p1HP
	p1_health_text.text = "P1: " + str(p1HP)
	p2_health_bar.value = p2HP
	p2_health_text.text = "P2: " + str(p2HP)


func choose_card(x, handnum):
	var cardKey = liveDeck[randi() % liveDeck.size()]
	var cardID = deck[cardKey]
	handnum[x].cardNum = cardID[0]
	handnum[x].cardSuit = cardID[1]
	handnum[x].dynamic_path = cardID[2]
	handnum[x].texture = load(handnum[x].dynamic_path)
	liveDeck.erase(cardKey)

func _on_trash_pressed() -> void:
	trash_UI.target_position.x = -1160
	rerolls += 1
	trash.disabled = true
	discard.disabled = true
	p1Hand = [card_1, card_2, card_3, card_4, card_5]
	p2Hand = [card_6, card_7, card_8, card_9, card_10]
	bothHands = p1Hand + p2Hand
	offsets = [-400, -200, 0, 200, 400]
	
	flip_sound.play()
	
	for i in range(0,10):
		if bothHands[i].trash == true:
			bothHands[i].trashing = true
			bothHands[i].trash = false
			bothHands[i].target_position = Vector2(-750, 0)
			
	
	await get_tree().create_timer(1.5).timeout
	
		
	
	for i in range(0,10):
		if bothHands[i].trashing == true:
			trash_UI.card_textures.append(bothHands[i].dynamic_path)
			bothHands[i].position = Vector2(0, 0)
			if i >= 5:
				bothHands[i].target_position = Vector2(offsets[i - 5], -275)
			else:
				bothHands[i].target_position = Vector2(offsets[i], 275)
			discard.texture = bothHands[i].texture
			choose_card(i, bothHands)
			bothHands[i].trashing = false
			flip_sound.play()
			await get_tree().create_timer(.1).timeout
	p1HandValue = check_hand(p1Hand)
	p1dmg = p1HandValue[1]
	p1_hand_value.text = p1HandValue[0] + " - " + str(p1dmg) + " dmg"
	p2HandValue = check_hand(p2Hand)
	p2dmg = p2HandValue[1]
	p2_hand_value.text = p2HandValue[0] + " - " + str(p2dmg) + " dmg"
	
	
	if rerolls == 3:
		await get_tree().create_timer(3).timeout
		p2HP -= p1dmg
		p1HP -= p2dmg
		if p1HP < 0: 
			p1HP = 0
		if p2HP < 0: 
			p2HP = 0
		for i in range(0,10):
			bothHands[i].target_position = Vector2(0, 0)
		discard.target_position = Vector2(0, 0)
		await get_tree().create_timer(1.5).timeout
		_ready()

	trash.disabled = false
	discard.disabled = false

func check_hand(handnum):
	values = [handnum[0].cardNum, handnum[1].cardNum, handnum[2].cardNum, handnum[3].cardNum, handnum[4].cardNum]
	values.sort()
	var straightCheck = [values[0], values[1] - 1, values[2] - 2, values[3] - 3, values[4] - 4]
	suits = [handnum[0].cardSuit, handnum[1].cardSuit, handnum[2].cardSuit, handnum[3].cardSuit, handnum[4].cardSuit]
	var matches = 0
	var siblings = 0
	var handValue = ["None", 0]
	
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
	
	return handValue
