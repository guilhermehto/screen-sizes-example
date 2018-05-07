extends Node2D

onready var Body = $Body

export var speed = 150

#Used for clamping
var half_body_width
var half_body_height
var screen_width
var screen_height

#Used for movement
var move_vector = Vector2(0, 0)
var has_horizontal_movement = false
var has_vertical_movement = false

func _ready():
	half_body_width = Body.region_rect.size.x / 2 * scale.x
	half_body_height = Body.region_rect.size.y / 2 * scale.y
	screen_width = get_viewport_rect().size.x
	screen_height = get_viewport_rect().size.y

func _process(delta):
	#Leave process if not moving
	if !has_vertical_movement and !has_horizontal_movement:
		return
	
	#Apply movement
	position += move_vector * speed * delta
	
	#Clamp position
	position.x = clamp(position.x, 0 + half_body_width, screen_width - half_body_width)
	position.y = clamp(position.y, 0 + half_body_height, screen_height - half_body_height)


func _on_MoveRight_button_down():
	move_vector.x = 1
	has_horizontal_movement = true

func _on_MoveLeft_button_down():
	move_vector.x = -1
	has_horizontal_movement = true

func _on_MoveUp_button_down():
	move_vector.y = -1
	has_vertical_movement = true

func _on_MoveDown_button_down():
	move_vector.y = 1
	has_vertical_movement = true

func _on_Horizontal_button_up():
	move_vector.x = 0
	has_horizontal_movement = false

func _on_Vertical_button_up():
	move_vector.y = 0
	has_vertical_movement = false
