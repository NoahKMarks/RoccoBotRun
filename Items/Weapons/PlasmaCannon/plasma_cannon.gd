extends Item

const BLAST_PROJECTILE = preload("res://Items/Weapons/PlasmaCannon/plasma_blast.tscn")

@export var target_group = "enemies"
@export var fire_rate : float
@export var damage : int = 100

#Charge Component
@export var max_charge : int = 4
@export var regen_rate : float = 0.5
@export var regen_cooldown = 2

@onready var shoot_component = $ShootComponent
@onready var charge_component = $ChargeComponent

@onready var shot_time = 1/fire_rate

func _ready() -> void:
	super()
	shoot_component.projectile = BLAST_PROJECTILE
	shoot_component.team = team
	print("plasma cannon ", team)
	shoot_component.damage = damage
	charge_component.max_charge = max_charge
	charge_component.charge_regen_rate = regen_rate
	charge_component.regen_cooldown = regen_cooldown

func use_item():
	if $Timer.is_stopped() and charge_component.charge>0 and can_use:
		can_use = false
		$Timer.start(shot_time)
		$AudioStreamPlayer3D.play()
		
		#Adding projectile
		charge_component.reduce_charge()
		$ShootComponent.shoot($SpawnPoint.global_transform)
		
func release_item():
	can_use = true

func set_item_team(t : Team):
	super(t)
	shoot_component.team = team


#Bug where cannon being unnequipped deletes projectile blast so make blast independant of the cannon
