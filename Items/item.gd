extends Node3D
class_name Item

signal item_used

@export var icon : Texture
var is_loose = false #item is on floor as a child of the ItemLoose Scene
var is_equipped : bool = false
var lock_rotation : bool = false #stops item from rotating when being held by roccobot
var can_use = true
var team : Team:
	set(value):
		team = value
		accent_color = team.accent_color
var accent_color : String = "pink"

#:
	##set(value):
		##print(self, value)
		#accent_color = value


static func create_item(packed_scene: PackedScene)->Item:
	var item_template = packed_scene.instantiate()
	var item = item_template.duplicate()
	#item.configure_item(accent_color)
	return item

func set_item_team(t : Team): #weapons or items with components should assign these components teams
	self.team = t

func set_item_loose(value):
	is_loose = value
	set_process(not is_loose)

#func configure_item(accent_color):
#	self.accent_color = accent_color
	#self.target_group = "enemies"

#func set_item_team(team):
#func set_equipped(is_equipped):
#	set_enabled(is_equipped)

func set_enabled(is_enabled : bool):
	self.set_process(is_enabled)
	self.visible = is_enabled

func use_item():
	#print("using_item")
	pass

func release_item():
	#print("releasing_item")
	pass
