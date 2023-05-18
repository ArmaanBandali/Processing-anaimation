Assignment 4:

"I Want to Play My Game" is a game composed of three minigames labelled as chores, with 3 levels labeled as days
Beat all three minigames within a given time limit to beat the level
Information about the controls to each minigame is on each minigame's screen

Programming Requirements:
	Image based animations:
		-Gopher popping up from ground
		-Character walking with lawn mower
		-Character shooting the trash like a basketball
		-Hand picking cards in memory game
	Sound effects:
		-ambient background music
		-metalic crash when successful shot in trash game
		-dog bark during collision with trash bag

Coding Requirements:
	Inheritance:
		-GameObject and MovingObject are superclasses
		-LawnMower, Dog, TrashBag, etc... are sub-sub classes
	Overriding Polymorphism:
		-drawMe(),animate(),move(),and collision() are methods using overriding polymorphism, but have different behaviour too
	Inclusion Polymorphism:
		-collision() is a method using superclass as the type to its parameter
	Containment:
		-TrashBag holds and array list of TrashBin, Character holds an array list of Card 
		
 

References:
-trashBin image: https://pixabay.com/vectors/delete-dustbin-garbage-can-1727486/
-trashBag image: https://pixabay.com/illustrations/bag-trash-waste-garbage-housewives-1010758/
-dog image: https://pixabay.com/illustrations/dog-animals-pet-bull-terrier-1454220/
-gopher image: https://pixabay.com/vectors/groundhog-animal-winter-rodent-153207/
-hallway lawnmower image: https://pixabay.com/vectors/lawnmower-lawn-mower-lawn-mower-155231/
-bg music: Sound from Zapsplat.com
-trash sound effect: https://freesound.org/people/Porklash/sounds/485580/
-dog bark sound: https://freesound.org/people/crazymonke9/sounds/418105/
-shimmer sound: https://freesound.org/people/gristi/sounds/562196/

-all original images drawn using Gimp on April 10, 2021