"
I am a solver for day 10 of Advent of Code 2024
"
Class {
	#name : 'Day10Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'trailMap',
		'numRows',
		'numCols',
		'trailHeads'
	],
	#category : 'AoCDay10',
	#package : 'AoCDay10'
}

{ #category : 'testing' }
Day10Solver >> isPointInRange: aPoint [ 
	^ (aPoint x between: 1 and: numRows ) and: (aPoint y between: 1 and: numCols)
]

{ #category : 'accessing' }
Day10Solver >> neighborsOf: aPoint [ 
	| neighbors height |
	height := trailMap atPoint: aPoint.
	neighbors := { aPoint + (1@0) . aPoint + (0@1) . aPoint - (1@0) . aPoint - (0@1) }.
	^ (neighbors select: [ :p | (self isPointInRange: p)]) select: [ :p | (trailMap atPoint: p) = (height + 1) ]
]

{ #category : 'accessing' }
Day10Solver >> numPathsStartingAt: aPoint unique: aBoolean [
	| curr next pathCount storeClass |
	storeClass := aBoolean ifTrue: [ OrderedCollection ] ifFalse: [ Set ].
	curr := storeClass new.
	pathCount := 0.
	curr add: aPoint.
	[ curr isEmpty ] whileFalse: [
		next := storeClass new.
		curr do: [ :p |
			((trailMap atPoint: p) = 9)	ifTrue: [ pathCount := pathCount + 1 ] ifFalse: [ next addAll: (self neighborsOf: p) ]
		].
		curr := next.
	].
	^ pathCount
]

{ #category : 'parsing' }
Day10Solver >> parseRawData [
	| temp |
	temp := rawData lines collect: [ :row | row asByteArray collect: [ :d | d asInteger - $0 asInteger ] ].
	numRows := temp size.
	numCols := (temp at: 1) size.
	trailMap := Array2D rows: numRows columns: numCols tabulate: [ :r :c | (temp at: r) at: c ].
	trailHeads := OrderedCollection new.
	1 to: numRows do: [ :r |
		1 to: numCols do: [ :c | 
			((trailMap at: r at: c) = 0) ifTrue: [trailHeads add: r@c] ]].
]

{ #category : 'solving' }
Day10Solver >> solvePart1 [
	^ (trailHeads collect: [ :trailHead | self numPathsStartingAt: trailHead unique: false ]) sum
]

{ #category : 'solving' }
Day10Solver >> solvePart2 [
	^ (trailHeads collect: [ :trailHead | self numPathsStartingAt: trailHead unique: true ]) sum
]
