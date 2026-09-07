# RoccoBot

## Shooting

### ItemLocations


### Target Positions and Skeleton Aim System
The current control method is that there is a left and right target. 
These are nodes that the skeleton tries to aim at. There are target_positions for these which is where the nodes continuouly lerp their position towards.
These are assigned buy clicking a location with the left or right mouse buttons
to shoot the q or e is pressed on the keyboard. Controller tbc.


When the player clicks shoot or has the use button held down the skeleton will use LookAtConstraints (with angle limitations) to try aim at the target.
The shoulder has more restricted movement and the hand has free movement and the elbow is somewhere in the middle.
Before the player shoots Roccobot needs time to pull out the item. This is stored in the ItemLocation object and is controlled by the influence of the Skeleton Modifiers.
