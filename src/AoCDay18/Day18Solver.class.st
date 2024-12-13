"
I am a solver for day 18 of Advent of Code 2024
"
Class {
	#name : 'Day18Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'gridSize',
		'bytes',
		'part1Size'
	],
	#category : 'AoCDay18',
	#package : 'AoCDay18'
}

{ #category : 'accessing' }
Day18Solver >> gridSize: anInteger [

	gridSize := anInteger
]

{ #category : 'parsing' }
Day18Solver >> parseRawData [

	| coords |
	bytes := rawData lines collect: [ :line |
		         coords := (line splitOn: $,) collect: #asInteger.
		         coords first @ coords second ]
]

{ #category : 'accessing' }
Day18Solver >> part1Size: anInteger [

	part1Size := anInteger
]

{ #category : 'solving' }
Day18Solver >> pathLengthWithFallen: fallenCount [

	| steps queue currPos fallen |
	fallen := (bytes first: fallenCount) asSet.
	steps := Dictionary newFromPairs: { 0@0 . 0 }.
	queue := { 0 @ 0 } asOrderedCollection.
	[ queue isNotEmpty ] whileTrue: [
		currPos := queue removeFirst.
		(currPos = (gridSize @ gridSize)) ifTrue: [ ^ steps at: currPos ].
		currPos fourNeighbors
			select: [ :neighbor | self validPosition: neighbor withFallen: fallen ]
			thenDo: [ :neighbor |
				(steps includesKey: neighbor) ifFalse: [
					steps at: neighbor put: (steps at: currPos) + 1.
					queue add: neighbor ] ] ].
	^ 0
]

{ #category : 'solving' }
Day18Solver >> solvePart1 [

	^ self pathLengthWithFallen: part1Size
]

{ #category : 'solving' }
Day18Solver >> solvePart2 [

	| lower upper mid |
	lower := part1Size.
	upper := bytes size.
	[ lower < upper ] whileTrue: [
		mid := upper + lower // 2.
		(self pathLengthWithFallen: mid) = 0
			ifTrue: [ upper := mid - 1 ]
			ifFalse: [ lower := mid + 1 ] ].
	^ '{1},{2}' format: {(bytes at: lower) x . (bytes at: lower) y}
]

{ #category : 'validating' }
Day18Solver >> validPosition: pos withFallen: fallen [

	^ (pos between: 0 @ 0 and: gridSize @ gridSize) & (fallen includes: pos) not
]
