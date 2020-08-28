extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel2.hide()
	set_process(true)
# Replace with function body.

func _process(delta):
	if translation.y < 0 :
		$Panel2.show()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
