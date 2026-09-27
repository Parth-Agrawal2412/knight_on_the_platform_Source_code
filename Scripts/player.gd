extends CharacterBody2D
class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
const TRAMPOLINE_JUMP_VELOCITY = -450

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 
	if Input.is_action_pressed("Left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h=true
	elif Input.is_action_pressed("Right"):
		velocity.x = SPEED
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h=false
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("Idle")

	move_and_slide()

func die():
	queue_free()
	get_tree().reload_current_scene()
	
func trampoline():
		velocity.y = TRAMPOLINE_JUMP_VELOCITY
	
	
	
	
	
