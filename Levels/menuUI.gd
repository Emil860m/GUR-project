extends CanvasLayer

@onready var play_button: TextureButton = $Control/MarginContainer/HBoxContainer/VBoxContainer/playButton
@onready var controls_button: TextureButton = $Control/MarginContainer/HBoxContainer/VBoxContainer/ControlsButton
@onready var quit_button: TextureButton = $Control/MarginContainer/HBoxContainer/VBoxContainer/quitButton
@onready var controls: TextureRect = $Control/TextureRect
@onready var test_name_input := $Control/TextEdit
var ui_disabled = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset") and not ui_disabled:
		get_tree().paused = not get_tree().paused
		visible = not visible
		

func _ready() -> void:
	play_button.pressed.connect(_press_play)
	controls_button.pressed.connect(_press_controls)
	quit_button.pressed.connect(_press_quit)
	
	
func _press_play():
	controls.visible = false
	visible = false
	get_tree().paused = false
	
func _press_controls():
	controls.visible = not controls.visible
	
func _press_quit():
	Talo.events.flush()
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	



func _on_testee_number_button_up() -> void:
	if not test_name_input.text == "":
		test_name_input.visible = false
		Talo.players.identify("test_service", test_name_input.text)
