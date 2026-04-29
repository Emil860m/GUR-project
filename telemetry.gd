extends Area2D

@export var id: String = ""

func _ready() -> void:
	assert(id != "")

func _on_body_entered(body: Node2D) -> void:
	if Talo.identity_check(true) == OK:
		Talo.events.track("area_enter", {
			"id": id,
			"at": Time.get_datetime_string_from_system(),
			"x": str(global_position.x),
			"y": str(global_position.y)
			})


func _on_body_exited(body: Node2D) -> void:
	if Talo.identity_check(true) == OK:
		Talo.events.track("area_exit", {
			"id": id,
			"at": Time.get_datetime_string_from_system(),
			"x": str(global_position.x),
			"y": str(global_position.y)
			})
