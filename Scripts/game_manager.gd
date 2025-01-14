extends Node

var p1_Cards = 0
var p2_Cards = 0



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("P1-Hit"):
		p1_Cards += 1
		print("Player 1 has " + str(p1_Cards) + " cards")
		  
	if Input.is_action_just_pressed("P2-Hit"):
		p2_Cards += 1
		print("Player 2 has " + str(p2_Cards) + " cards")
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

#hello
