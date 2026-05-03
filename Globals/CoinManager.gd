extends Node

signal coin_collection(value: int)

var total_coins: int = 0
var collected_coinsId = [] #Store collected coins
	
func coin_collected(value: int):
	total_coins += value
	emit_signal("coin_collection", total_coins)
