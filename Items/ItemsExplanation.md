#Items

## General Item Class

## ItemsAndWeapons Blender file
most of the items models are from a blender file called ItemsAnd Weapons and they use inherited scenes. 
This means that updating the file will update the items automatically (However a new texture will need to be assigned)
However all the item meshes will be present in each scene using this file. To fix this a lot of the items do have other items meshes hidden and nodes set_process to false 
but the base Item class also use a script to compare the items by their item name to the mesh name. This does mean the name in the blender file must be the same as the item's name.
(Maybe an improvement could be that each item stores a reference to its mesh, this is already stored by ownly the shield and could also make it easier to reassign materials)

### Item Loose
An item loose scene is a scene that just stores a item that is on the floor so that it can be picked up.
It has a few paramters to make the item bob around.
The item also has an is_loose paramter and a setter which will set the process false if the item is loose. Some items like the shield will have other behaviour when loose.


## Specific Items
Move this into seperate files if project grows

### Grenade Launcher

For all these weapons the items pass data to their child projectiles for the final explosion
for this data like team and damage is passed to the grenade then the explosion

### Laser Shield

The shield will block incoming projectiles, 
The shield also has a special shader that is transparent and glows

An upgrade to the shader would be to make it so it briefly glows the color of the projectile it absorbs
