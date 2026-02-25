extends ColorRect

@onready var mat := material as ShaderMaterial
var shader_time := 0.0

func _process(delta: float) -> void:
	if not get_tree().paused:
		shader_time += delta
		mat.set_shader_parameter("shader_time", shader_time)
