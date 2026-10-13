extends Node2D

var car_scene: PackedScene =preload("res://scenes/car.tscn")
var score: int = 0

func _on_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")
	setScore()

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered",go_to_title)

func _on_score_timer_timeout() -> void:
	addScore()

func go_to_title(_body):
	call_deferred("change_scene")

func addScore():
	score += 1
	$CanvasLayer/Label.text = "Score : " + str(score)

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")

func setScore():
	if score > Global.score:
		Global.score = score
