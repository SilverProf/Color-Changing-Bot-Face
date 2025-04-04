shader_type canvas_item;

uniform vec3 innerColor = vec3(0.5);
uniform vec3 outerColor = vec3(1.0);
uniform float radius = 0.0;

float distFromCenter(vec2 uv) {
	float a = abs(uv.x - .5);
	float b = abs(uv.y - .5);
	return sqrt((a * a) + (b * b));
}

bool insideCircle(vec2 uv) {
	return distFromCenter(uv) < radius;
}

vec3 grayscale(vec3 col) {
	float c = (col.x + col.y + col.z) / 3.0;
	return vec3(c);
}

void fragment() {
	vec3 c = (insideCircle(UV)) ? innerColor : outerColor;
	COLOR = vec4(grayscale(COLOR.xyz) * c, 1.0);
}
