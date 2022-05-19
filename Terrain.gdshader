shader_type spatial;

//render_mode unshaded;

uniform sampler2D noise;
uniform sampler2D normalmap;

uniform float wavelength = 1;
uniform float height_offset = 1;
uniform float height_scale = 0.5;
uniform float red = 1;


varying vec2 tex_position;
varying vec4 colour;

vec4 getBiome(float e) {
	if(e < 0.0) {
		return vec4(0,0,1,1);
	}
	return vec4(0,1,0,1);
}


void vertex() {
	tex_position = VERTEX.xz/2.0 + 0.5;
	
	float e = (texture(noise, tex_position/wavelength).x * height_scale)- height_offset;
	
	colour = getBiome(e);
	
	VERTEX.y = e ;
	
}

void fragment() {
	ALBEDO = colour.rgb;
}

