extends ColorRect

@onready var mat := material as ShaderMaterial
var shader_time := 0.0

func _ready() -> void:
	mat.set_shader_parameter("nVariable", 2.8)
	mat.set_shader_parameter("dVariable", .8)

func _process(delta: float) -> void:
	if not get_tree().paused:
		shader_time += delta
		mat.set_shader_parameter("shader_time", shader_time)

func oneMore() -> void:
	var v: float = float(mat.get_shader_parameter("nVariable"))
	var d: float = float(mat.get_shader_parameter("dVariable"))
	mat.set_shader_parameter("nVariable", v + 0.1)
	mat.set_shader_parameter("dVariable", d + .05)
