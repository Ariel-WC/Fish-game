extends CharacterBody2D

@onready var Player_spr = $AnimationPlayer

func input():
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		Player_spr.play("Fishing_transition")
	elif (Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		Player_spr.play("Idle")

func _ready():
	Player_spr.play("Idle")

func _process(_delta):
	input()
