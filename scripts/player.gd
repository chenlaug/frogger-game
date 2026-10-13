extends CharacterBody2D

@onready
var animationSprite:AnimatedSprite2D = $Sprite2D

var direction: Vector2 = Vector2.ZERO
var speed: float = 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed 
	animation()
	move_and_slide()

func animation():
	if direction:
		animationSprite.flip_h = direction.x > 0
		if direction.x != 0:
			animationSprite.play("Left")
		else:
			animationSprite.play("Down") if direction.y < 0 else animationSprite.play("Up") 
	else:
		animationSprite.frame = 0
