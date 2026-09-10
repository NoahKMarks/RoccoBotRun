#Globals Teams and Materials

## Globals
Globals is a autoload script that holds lots of relevant data to the game such as teams and currently materials
Materials Maybe should be put in a sepearate autoload

## Materials
I have a list of material templates and also Material colors
When a object wants to use one of these templates it will go to globals, give the template (which is in an enum for easy typehints) 
and the color which will usually be the objects accent color.
Globals will then return either make or retrieve the correct material. This means that materials are not dupliacted each time they are used
