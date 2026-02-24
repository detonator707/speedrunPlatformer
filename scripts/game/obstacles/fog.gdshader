shader_type canvas_item;

//noise texture
uniform sampler2D noise_texture: repeat_enable, filter_nearest;
//fog density
uniform float density: hint_range(0.0, 1.0) = .25;
//Fog speed
uniform vec2 speed = vec2(.02, .01);

void fragment(){
	vec2 uv = UV + speed * TIME;
	//Sample the noise texture
	float noise = texture(noise_texture, uv).r * 1.3;
	//
	float fog = clamp(noise * 2.0 - 1.0, 0.0,1.0);
	//apply the fog effect
	COLOR.a *= fog * density * .8;
}
