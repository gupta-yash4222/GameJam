extends KinematicBody

var speed = 300
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
# Replace with function body.

func _process(delta):
	
	direction = Vector3(0,0,0)
	gravity = -9.8
	if Input.is_action_pressed("ui_left"):
		direction.z += 1
	if Input.is_action_pressed("ui_right"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.x -= 1
	direction.normalized()
	direction = direction*speed*delta
	
	if velocity.y > 0:
		gravity = -20
	else :
		gravity = -30
	
	velocity.y += gravity*delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 10
		
	var hitcount = get_slide_count()
	if hitcount > 0:
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.apply_impulse(collision.position, collision.normal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
