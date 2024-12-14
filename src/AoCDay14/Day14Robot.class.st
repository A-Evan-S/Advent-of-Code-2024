"
I am a robot who walks in a straight line (looping around walls)
"
Class {
	#name : 'Day14Robot',
	#superclass : 'Object',
	#instVars : [
		'position',
		'velocity'
	],
	#category : 'AoCDay14',
	#package : 'AoCDay14'
}

{ #category : 'instance creation' }
Day14Robot class >> newFromString: aString [ 
	| re nums robot |
	re := '(-?\d+)' asRegex.
	nums := (re matchesIn: aString) collect: #asInteger.
	robot := self new.
	robot position: nums first @ nums second.
	robot velocity: nums third @ nums fourth.
	^ robot
]

{ #category : 'accessing' }
Day14Robot >> position [

	^ position
]

{ #category : 'accessing' }
Day14Robot >> position: aPoint [

	position := aPoint
]

{ #category : 'updating' }
Day14Robot >> stepWithWidth: width height: height [

	position := position + velocity.
	position := (position x % width) @ (position y % height)
]

{ #category : 'accessing' }
Day14Robot >> velocity: aPoint [

	velocity := aPoint
]
