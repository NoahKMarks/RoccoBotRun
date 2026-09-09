# RoccoBot

## Shooting

## Animations
I have made a set of animations which are actions in blender. There are also static poses and some animations use -loop to signal to godot they must loop eg walking.
I am using an animation tree with blend2 nodes to control the animations. each animation has a parameter which is the influence.
There is an Enum which has all the different states of the animation. This includes mixes of animations eg crouch_walk. 
A switch statement is used to set the blend amounts of each animation which is an action in blender.

## Items, ItemLocations and Rig


### Target Positions and Skeleton Aim System
The current control method is that there is a left and right target. 
These are nodes that the skeleton tries to aim at. There are target_positions for these which is where the nodes continuouly lerp their position towards.
These are assigned buy clicking a location with the left or right mouse buttons
to shoot the q or e is pressed on the keyboard. Controller tbc.


When the player clicks shoot or has the use button held down the skeleton will use LookAtConstraints (with angle limitations) to try aim at the target.
The shoulder has more restricted movement and the hand has free movement and the elbow is somewhere in the middle.
Before the player shoots Roccobot needs time to pull out the item. This is stored in the ItemLocation object and is controlled by the influence of the Skeleton Modifiers.

#### Item Locking
Some Items eg the shield I do not want to rotate on all axis to look at the target. The item base class has a lock parameter that determines if the item will rotate this way.
When the item is equiped the itemlocation it is equipped at will reference its look at nodes and use the secondary rotation attribute to make them rotate on only one axis.
