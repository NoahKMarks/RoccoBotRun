extends Node3D
class_name ShootComponent

var projectile : Resource

#Multiples of PI e.g:PI/72
var bloom_angle : float = 0

var damage : float
#var target_group = "enemies"
var team : Team

func shoot(base_transform):
	self.global_transform = base_transform
	var projectile = projectile.instantiate()
	projectile.team = self.team
	projectile.damage = damage
	projectile.global_position = global_position
	get_tree().current_scene.add_child(projectile)
	
	
	var base_dir = -global_transform.basis.z
	var result_dir = base_dir
	#Adding Bloom
	if bloom_angle != 0:
		var vertical_spread_angle = randf_range(-bloom_angle, bloom_angle)
		var vertical_spread_dir = Basis(global_transform.basis.x, vertical_spread_angle)

		var horizontal_spread_angle = randf_range(-bloom_angle, bloom_angle)
		var horizontal_spread_dir = Basis(global_transform.basis.y, horizontal_spread_angle)
		

		result_dir = vertical_spread_dir * horizontal_spread_dir * result_dir

	projectile.look_at(global_transform.origin+result_dir, Vector3.UP)
	
	return projectile
