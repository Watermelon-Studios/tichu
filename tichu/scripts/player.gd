extends Node



class player():

@onready var hand: CardCollection3D = $DragController/Hand

func _input(event):
	if event.is_action_pressed("ui_down"):
		add_card()
	elif event.is_action_pressed("ui_up"):
		remove_card()
	elif event.is_action_pressed("ui_left"):
		clear_cards()
	elif event.is_action_pressed("ui_right"):
		if pile.card_layout_strategy is PileCardLayout and hand.card_layout_strategy is LineCardLayout:
			var layout := LineCardLayout.new()
			pile.card_layout_strategy = layout
		elif hand.card_layout_strategy is LineCardLayout:
			hand.card_layout_strategy = FanCardLayout.new()
		elif pile.card_layout_strategy is LineCardLayout:
			pile.card_layout_strategy = PileCardLayout.new()
		elif hand.card_layout_strategy is FanCardLayout:
			hand.card_layout_strategy = LineCardLayout.new()
