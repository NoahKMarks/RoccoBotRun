shader_type spatial;


void vertex() {
	// Called for every vertex the material is visible on.
}

uniform sampler2D alpha_tex : source_color;
uniform sampler2D emmision_tex : source_color;

uniform float emmission_strength = 1.0;
uniform float alpha_strength = 1.0;
uniform vec3 base_color = vec3(0,1,0);
render_mode cull_disabled;


void fragment() {
	// Called for every pixel the material is visible on.
	ALBEDO = base_color;
	//ALPHA = 0.6;
	EMISSION = base_color*emmission_strength*texture(emmision_tex, UV).r;
	ALPHA = 0.4* texture(alpha_tex, UV).r * sin(TIME * 5.0 + UV.y * PI*4.0) + 0.6;

	ROUGHNESS = 0.9;
    METALLIC  = 0.0;


}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
