extends Area3D

@export var item_scene : PackedScene
#Crashes if it is not an item that is added
var spin_speed = 1
var item_position : Vector3 = Vector3(0,0.3,0)
var item_phase = 0
var item_bob_period = 2.5
var item_bob_amp = 0.1

func _ready() -> void:
	
	if item_scene:
		var new_item = Item.create_item(item_scene)
		$ItemContainer.add_child(new_item)
		new_item.set_item_loose(true)
		#item_position = $ItemContainer.position
	
#Item probably shouldnt be telling player to pick it up
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and body.has_method("add_item"):
		if $ItemContainer.get_child_count()>0:
			var item = $ItemContainer.get_child(0)
			item.is_loose = false
			$ItemContainer.remove_child(item)
			body.add_item(item)
			$CollectSound.play()
		set_process(false)
		visible = false

func _process(delta: float) -> void:
	$ItemContainer.rotate_y(delta*spin_speed)
	item_phase += delta*2*PI/item_bob_period
	$ItemContainer.position = item_position + Vector3.UP*item_bob_amp*sin(item_phase)

func _on_collect_sound_finished() -> void:
	queue_free()
