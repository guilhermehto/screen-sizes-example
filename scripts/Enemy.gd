extends Node2D

const SPEED = 200

#Movement direction, set externally when instantiated
var direction_x = 1
var direction_y = 1

func _process(delta):
	position.x += SPEED * direction_x * delta
	position.y += SPEED * direction_y * delta

#Delete it so we don't spend resources uncessary
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
