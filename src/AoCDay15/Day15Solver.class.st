"
I am a solver for day 15 of Advent of Code 2024
"
Class {
	#name : 'Day15Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'maze',
		'bigPosition',
		'currentPosition',
		'instructions',
		'bigMaze'
	],
	#category : 'AoCDay15',
	#package : 'AoCDay15'
}

{ #category : 'as yet unclassified' }
Day15Solver >> attemptMoveBigBox: boxPosition direction: delta [

	| boxPos |
	boxPos := boxPosition.
	delta = (0 @ 1) ifTrue: [
		(self canMoveRight: boxPos) ifTrue: [ self moveRight: boxPos. ^ true ] ].
	delta = (0 @ -1) ifTrue: [
		(self canMoveLeft: boxPos) ifTrue: [ self moveLeft: boxPos. ^ true ] ].
	((bigMaze atPoint: boxPos) = $]) ifTrue: [ boxPos := boxPos - (0 @ 1) ].
	delta = (1 @ 0) ifTrue: [
		(self canMoveDown: boxPos) ifTrue: [ self moveDown: boxPos. ^ true ] ].
	delta = (-1 @ 0) ifTrue: [
		(self canMoveUp: boxPos) ifTrue: [ self moveUp: boxPos. ^ true ] ].

	^ false
]

{ #category : 'as yet unclassified' }
Day15Solver >> attemptMoveBigSelf: direction [

	| delta deltas nextSpot |
	deltas := Dictionary newFromPairs: { $>. (0 @ 1). $<. (0 @ -1). $^. (-1 @ 0). $v. (1 @ 0) }.
	delta := deltas at: direction.
	nextSpot := bigMaze atPoint: bigPosition + delta.
	nextSpot = $.
		ifTrue: [ bigPosition := bigPosition + delta ]
		ifFalse: [
			nextSpot = $# ifFalse: [
				(self attemptMoveBigBox: bigPosition + delta direction: delta)
					ifTrue: [ bigPosition := bigPosition + delta ] ] ]
]

{ #category : 'as yet unclassified' }
Day15Solver >> attemptMoveBox: boxPosition direction: delta [

	| nextSpot |
	nextSpot := maze atPoint: boxPosition + delta.
	^ nextSpot = $.
		  ifTrue: [
			  maze
				  swap: boxPosition x
				  at: boxPosition y
				  with: (boxPosition + delta) x
				  at: (boxPosition + delta) y.
			  true ]
		  ifFalse: [
			  nextSpot = $O
				  ifTrue: [
						(self attemptMoveBox: (boxPosition + delta) direction: delta ) ifTrue: [
						maze
				  swap: boxPosition x
				  at: boxPosition y
				  with: (boxPosition + delta) x
				  at: (boxPosition + delta) y.
			  true
						] ifFalse: [ false ] 
					]
				  ifFalse: [ false ] ]
]

{ #category : 'as yet unclassified' }
Day15Solver >> attemptMoveSelf: direction [ 
	| delta deltas nextSpot |
	deltas := Dictionary newFromPairs: { $> . 0@1 . $< . 0 @ -1 . $^ . -1 @ 0 . $v . 1 @ 0 }.
	delta := deltas at: direction.
	nextSpot := maze atPoint: (currentPosition + delta).
	(nextSpot = $.) ifTrue: [
		currentPosition := currentPosition + delta.
	] ifFalse: [ (nextSpot = $O) ifTrue: [
		(self attemptMoveBox: (currentPosition + delta) direction: delta) ifTrue: [ currentPosition := currentPosition + delta. ].
	]. ].
	
]

{ #category : 'testing' }
Day15Solver >> canMoveDown: aPoint [
	| leftPos rightPos leftHalf rightHalf|
	leftPos := bigMaze atPoint: (aPoint + (1@0)).
	rightPos := bigMaze atPoint: (aPoint + (1@1)).
	leftHalf := (leftPos = $.) ifTrue: [ true ] ifFalse: [
	(leftPos = $#) ifTrue: [ false ] ifFalse: [
	(leftPos = $[) ifTrue: [ self canMoveDown: (aPoint + (1@0)) ] ifFalse: [
		self canMoveDown: (aPoint + (1@ -1))
	].
	].
	].

		rightHalf := (rightPos = $.) ifTrue: [ true ] ifFalse: [
	(rightPos = $#) ifTrue: [ false ] ifFalse: [
	(rightPos = $[) ifTrue: [ self canMoveDown: (aPoint + (1@1)) ] ifFalse: [
		self canMoveDown: (aPoint + (1@ 0))
	].
	].
	].
	^ leftHalf & rightHalf
]

{ #category : 'testing' }
Day15Solver >> canMoveLeft: aPoint [ 
	"always called on ] block"
	| nextPos |
	nextPos := bigMaze atPoint: (aPoint + (0@ -2)).
	^ (nextPos = $#) ifTrue: [ false ] ifFalse: [
		(nextPos = $.) ifTrue: [ true ] ifFalse: [
		self canMoveLeft: (aPoint + (0@ -2))
		]
		]
]

{ #category : 'testing' }
Day15Solver >> canMoveRight: aPoint [
	"always called on [ block"
	| nextPos |
	nextPos := bigMaze atPoint: (aPoint + (0@2)).
	^ (nextPos = $#) ifTrue: [ false ] ifFalse: [
		(nextPos = $.) ifTrue: [ true ] ifFalse: [
		self canMoveRight: (aPoint + (0@2))
		]
		]
]

{ #category : 'testing' }
Day15Solver >> canMoveUp: aPoint [
	"always called on [ block"
	| leftPos rightPos leftHalf rightHalf|
	leftPos := bigMaze atPoint: (aPoint + (-1@0)).
	rightPos := bigMaze atPoint: (aPoint + (-1@1)).
	
	leftHalf := (leftPos = $.) ifTrue: [ true ] ifFalse: [
	(leftPos = $#) ifTrue: [ false ] ifFalse: [
	(leftPos = $[) ifTrue: [ self canMoveUp: (aPoint + (-1@0)) ] ifFalse: [
		self canMoveUp: (aPoint + (-1@ -1))
	].
	].
	].

	rightHalf := (rightPos = $.) ifTrue: [ true ] ifFalse: [
	(rightPos = $#) ifTrue: [ false ] ifFalse: [
	(rightPos = $[) ifTrue: [ self canMoveUp: (aPoint + (-1@1)) ] ifFalse: [
		self canMoveUp: (aPoint + (-1@ 0))
	].
	].
	].
	^ leftHalf & rightHalf 
]

{ #category : 'as yet unclassified' }
Day15Solver >> makeBigMaze [
	bigMaze := Array2D rows: (maze numberOfRows) columns: (maze numberOfColumns * 2).
	maze withIndicesDo: [ :v :r :c |
		(v = $#) ifTrue: [ bigMaze at: r at: (2*c) put: $#. bigMaze at: r at: (2*c-1) put: $#. ] ifFalse: [
		(v = $.) ifTrue: [ bigMaze at: r at: (2*c) put: $.. bigMaze at: r at: (2*c-1) put: $.. ] ifFalse: [
		bigMaze at: r at: (2*c) put: $]. bigMaze at: r at: (2*c-1) put: $[.
		].
		].
	].
]

{ #category : 'reordering' }
Day15Solver >> moveDown: aPoint [
	"always called on ["
	(bigMaze atPoint: aPoint ifInvalid: $#) = $] ifTrue: [ ^ self moveDown: (aPoint - (0@ 1)) ].
	(bigMaze atPoint: aPoint ifInvalid: $#) = $[ ifFalse: [ ^ self ].
	self moveDown: aPoint + (1 @ 0).
	self moveDown: aPoint + (1 @ 1).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: (aPoint y + 1) put: $..
	bigMaze at: (aPoint x + 1) at: aPoint y put: $[.
	bigMaze at: (aPoint x + 1) at: aPoint y + 1 put: $]
]

{ #category : 'as yet unclassified' }
Day15Solver >> moveLeft: aPoint [ 

	(bigMaze atPoint: aPoint ifInvalid: $#) = $] ifFalse: [ ^ self ].
	self moveLeft: aPoint + (0 @ -2).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: (aPoint y - 1) put: $].
	bigMaze at: aPoint x at: (aPoint y - 2) put: $[
]

{ #category : 'as yet unclassified' }
Day15Solver >> moveRight: aPoint [

	(bigMaze atPoint: aPoint ifInvalid: $#) = $[ ifFalse: [ ^ self ].
	self moveRight: aPoint + (0 @ 2).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: aPoint y + 1 put: $[.
	bigMaze at: aPoint x at: aPoint y + 2 put: $]
]

{ #category : 'keyboard control' }
Day15Solver >> moveUp: aPoint [
	"always called on ["
	(bigMaze atPoint: aPoint ifInvalid: $#) = $] ifTrue: [ ^ self moveUp: (aPoint - (0@ 1)) ].
	(bigMaze atPoint: aPoint ifInvalid: $#) = $[ ifFalse: [ ^ self ].
	self moveUp: aPoint + (-1 @ 0).
	self moveUp: aPoint + (-1 @ 1).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: (aPoint y + 1) put: $..
	bigMaze at: (aPoint x - 1) at: aPoint y put: $[.
	bigMaze at: (aPoint x - 1) at: aPoint y + 1 put: $]
]

{ #category : 'parsing' }
Day15Solver >> parseRawData [
	| mazeData instructionData |
	rawData := String cr join: rawData lines.
	mazeData := (rawData splitOn: (String cr , String cr)) first lines.
	instructionData := (rawData splitOn: (String cr , String cr)) second lines.
	instructions := '' join: instructionData.
	maze := Array2D rows: (mazeData size) columns: (mazeData first size).
	maze indicesDo: [ :r :c | maze at: r at: c put: ((mazeData at: r) at: c) ].
	currentPosition := maze indexOf: $@.
	bigPosition := (currentPosition x ) @ (currentPosition y * 2 - 1).
	maze at: currentPosition x at: currentPosition y put: $..
	self makeBigMaze.
]

{ #category : 'solving' }
Day15Solver >> solvePart1 [
	instructions do: [ :instruction | self attemptMoveSelf: instruction ].
	^ (maze withIndicesCollect: [ :v :r :c | (v = $O) ifTrue: [ 100 * (r - 1) + (c - 1) ] ifFalse: [ 0 ] ]) sum
]

{ #category : 'solving' }
Day15Solver >> solvePart2 [
	instructions do: [ :instruction | self attemptMoveBigSelf: instruction ].
	^ (bigMaze withIndicesCollect: [ :v :r :c | (v = $[) ifTrue: [ 100 * (r - 1) + (c - 1) ] ifFalse: [ 0 ] ]) sum
]
