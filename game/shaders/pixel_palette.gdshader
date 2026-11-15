// Post-process for the low-res 3D view: ordered (Bayer) dither, then either
// snap to a fixed palette or posterize. Applied to the TextureRect that shows
// the SubViewport, so it runs once per low-res pixel.
shader_type canvas_item;

uniform int mode = 1;              // 0 off, 1 palette, 2 posterize
uniform float levels = 6.0;        // posterize steps per channel
uniform float dither_strength = 0.35;
uniform vec3 palette[16];
uniform int palette_size = 16;

const float BAYER[16] = float[16](
	0.0, 8.0, 2.0, 10.0,
	12.0, 4.0, 14.0, 6.0,
	3.0, 11.0, 1.0, 9.0,
	15.0, 7.0, 13.0, 5.0);

void fragment() {
	vec4 src = texture(TEXTURE, UV);
	if (mode == 0) {
		COLOR = src;
	} else {
		ivec2 p = ivec2(UV * vec2(textureSize(TEXTURE, 0)));
		float b = BAYER[(p.y % 4) * 4 + (p.x % 4)] / 16.0 - 0.5;
		vec3 c = src.rgb + b * dither_strength / levels;
		vec3 outc;
		if (mode == 1) {
			float best = 1e9;
			outc = palette[0];
			for (int i = 0; i < palette_size; i++) {
				vec3 d = c - palette[i];
				float dist = dot(d, d);
				if (dist < best) {
					best = dist;
					outc = palette[i];
				}
			}
		} else {
			outc = floor(clamp(c, 0.0, 1.0) * levels + 0.5) / levels;
		}
		COLOR = vec4(outc, 1.0);
	}
}
