shader_type spatial;


void vertex() {
	// Called for every vertex the material is visible on.
}

uniform sampler2D shield_alpha_tex : source_color;
uniform sampler2D shield_emmision_tex : source_color;

uniform float emmission_strength = 1.0;
uniform float alpha_strength = 1.0;
uniform vec3 color = vec3(0,1,0);


void fragment() {
	// Called for every pixel the material is visible on.
	vec3 base_color = color;

	//vec3 emmision_tex = texture(shield_emmision_tex, UV).rgb;
	//EMISSION = shield_emmision_tex*emmission_strength;

	//vec3 alpha_tex = texture(shield_alpha_tex, UV).rgb;
	//float a = texture(alpha_tex, UV).r;
	//ALPHA = a*alpha_strength;
	ALPHA = 0.6;
	vec2 uv_scrolled = UV;

    ALBEDO = base_color;
    EMISSION = base_color * (0.6 + 0.4 * sin(TIME * 5.0 + UV.y * PI*2.50));
    ALPHA = 0.5;
    //ROUGHNESS = 0.1;
    //METALLIC  = 0.0;


}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
