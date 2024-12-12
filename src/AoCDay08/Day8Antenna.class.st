"
I am an antenna with a position on the map and a frequency (character)
"
Class {
	#name : 'Day8Antenna',
	#superclass : 'Object',
	#instVars : [
		'position',
		'frequency'
	],
	#category : 'AoCDay08',
	#package : 'AoCDay08'
}

{ #category : 'calculating' }
Day8Antenna >> allAntinodesWith: aDay8Antenna within: aRectangle [

	| delta antinodes pos |
	self assert: self frequency = aDay8Antenna frequency.
	delta := self position - aDay8Antenna position.
	antinodes := Set new.
	pos := self position.
	[aRectangle containsPoint: pos] whileTrue: [ antinodes add: pos. pos := pos + delta. ].
	pos := self position.
	[aRectangle containsPoint: pos] whileTrue: [ antinodes add: pos. pos := pos - delta. ].
	^ antinodes
]

{ #category : 'accessing' }
Day8Antenna >> frequency [

	^ frequency
]

{ #category : 'accessing' }
Day8Antenna >> frequency: anObject [

	frequency := anObject
]

{ #category : 'accessing' }
Day8Antenna >> position [

	^ position
]

{ #category : 'accessing' }
Day8Antenna >> position: anObject [

	position := anObject
]

{ #category : 'calculating' }
Day8Antenna >> singleAntinodesWith: aDay8Antenna within: aRectangle [

	| delta antinodes |
	delta := self position - aDay8Antenna position.
	antinodes := { self position + delta . aDay8Antenna position - delta }.
	^ antinodes select: [ :point | aRectangle containsPoint: point ]
]
