extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel1.hide()
	$Panel2.hide()
	$Panel3.hide()
	set_process(true)
# Replace with function body.

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().reload_current_scene()
	if $Ball.translation.y < 0:
		$Panel2.show()
	if $Kicker.translation.y < 0:
		$Panel3.show()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body is RigidBody:
		print("MAN YOU DID IT")
		$Panel1.show()
# Replace with function body.
