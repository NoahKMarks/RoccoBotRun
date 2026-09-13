extends Node

var teams = {
	"unassigned" : Team.new("unassigned", "pink"),
	"neutral" : Team.new("neutral", "white"),
	"player" : Team.new("player", "blue"),
	"enemy_robot" : Team.new("enemies", "red"),	
}
func get_team(team_string):
	var team = Globals.teams.get(team_string, Globals.teams["unassigned"])
	if team == Globals.teams["neutral"] and team_string != "neutral":
		print("Invalid Team used, set to neutral")
		push_warning("%s tried to use invalid team '%s', defaulting to neutral")
	return team

enum MaterialTemplates {
	LaserMat,
	TransparentGlowMat,
	LaserShieldShader,
}

var material_colors = {
	"blue" : Color("bfeaff"), 
	"pink" : Color("ff42e0ff"),
	"red" : Color("ff4040"),
	"green" : Color("408c55ff"),
}

var created_materials = {}

func make_material(template : MaterialTemplates, color_name : String):
	var color = material_colors[color_name]
	var mat : Material
	match template:
		MaterialTemplates.LaserMat:
			mat = preload("res://Materials/laser_mat.tres").duplicate()
			mat.albedo_color = color
			mat.emission = color
		MaterialTemplates.TransparentGlowMat:
			mat = preload("res://Materials/transparent_glow_mat.tres").duplicate()
			mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			var mat_alpha = mat.albedo_color.a
			mat.albedo_color = color
			mat.albedo_color.a = mat_alpha
			mat.emission = color
		MaterialTemplates.LaserShieldShader:
			mat = preload("res://Items/LaserShield/laser_shield_shader.tres").duplicate()
			mat.set_shader_parameter("base_color", Vector3(color.r,color.g,color.b))
			
			mat.set_shader_parameter("color", Vector3(color.r,color.g,color.b))
			
	return mat

func get_material(template : MaterialTemplates, color_name : String):
	var exists = false
	for key in created_materials:
		if key[0]==template and key[1]==color_name:
			exists = true
	if exists == false:
		var new_mat = make_material(template, color_name)
		created_materials[[template, color_name]]  = new_mat
		print("making new mat")
		print(created_materials)
	return created_materials[[template, color_name]]
		
			
