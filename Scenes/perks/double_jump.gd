
extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)





func _process(delta: float) -> void:
	pass


@export var extra_jumps := 1



func _on_body_entered(body: Node) -> void:

	if body.has_method("enable_double_jump"):
		body.enable_double_jump(extra_jumps)
		queue_free()
