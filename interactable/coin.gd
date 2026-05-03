extends Interactable

@export var value: int = 1

func _ready() -> void:
	if self.name in CoinManager.collected_coinsId: #Delete collected Coins after respawning player
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		CoinManager.collected_coinsId.append(self.name) #storeName
		CoinManager.coin_collected(value)
		self.visible = false
		self.queue_free()
