extends "res://Overlap/Hitbox.gd"

var knockback_vector = Vector2.ZERO
var velocity = Vector2.ZERO
var direction = Vector2.RIGHT
var _rotation = 0
var speed = 20
onready var collisionShape = $CollisionShape2D
onready var particles = $CPUParticles2D
onready var light = $Light2D

func _physics_process(delta):
	particles.rotation_degrees = _rotation
	translate(direction * delta)

func cast(velocity, speed):
	enabled()
	direction = velocity * speed

func enabled():
	collisionShape.disabled = false
	particles.emitting = true


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_area_entered(area):
	queue_free()
