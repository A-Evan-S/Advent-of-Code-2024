Class {
	#name : 'Day8Antenna',
	#superclass : 'Object',
	#instVars : [
		'position',
		'frequency'
	],
	#category : 'AoCDay8',
	#package : 'AoCDay8'
}

{ #category : 'as yet unclassified' }
Day8Antenna >> antinodesWith: aDay8Antenna [

	| delta |
	delta := (self position) - (aDay8Antenna position).
	^ {
		  (self position + delta).
		  (aDay8Antenna position - delta) }
]

{ #category : 'as yet unclassified' }
Day8Antenna >> antinodesWith: aDay8Antenna upTo: aPoint [

	| delta antinodes pos |
	delta := self position - aDay8Antenna position.
	antinodes := Set new.
	pos := self position.
	[pos >= (1 @ 1)] whileTrue: [
		antinodes add: pos.
		pos := pos + delta ].
	pos := self position.
	[pos <= aPoint] whileTrue: [
		antinodes add: pos.
		pos := pos - delta ].
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
