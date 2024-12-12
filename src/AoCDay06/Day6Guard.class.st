"
I am the guard moving around the map
"
Class {
	#name : 'Day6Guard',
	#superclass : 'Object',
	#instVars : [
		'position',
		'direction'
	],
	#category : 'AoCDay06',
	#package : 'AoCDay06'
}

{ #category : 'comparing' }
Day6Guard >> = aGuard [
	^ ((self position) = (aGuard position)) and: ((self direction) = (aGuard direction))
]

{ #category : 'accessing' }
Day6Guard >> direction [

	^ direction
]

{ #category : 'accessing' }
Day6Guard >> direction: anObject [

	direction := anObject
]

{ #category : 'comparing' }
Day6Guard >> hash [
	^ { position . direction } hash
]

{ #category : 'accessing' }
Day6Guard >> position [

	^ position
]

{ #category : 'accessing' }
Day6Guard >> position: anObject [

	position := anObject
]

{ #category : 'modifying' }
Day6Guard >> turnRight [

	| turnDict |
	turnDict := Dictionary newFrom: {
			            (-1 @ 0 -> (0 @ 1)).
			            (0 @ 1 -> (1 @ 0)).
			            (1 @ 0 -> (0 @ -1)).
			            (0 @ -1 -> (-1 @ 0)) }.
	direction := turnDict at: direction
]
