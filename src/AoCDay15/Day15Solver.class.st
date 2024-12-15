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

{ #category : 'moving' }
Day15Solver >> attemptMoveBigSelf: direction [

	direction = $< ifTrue: [
		(self canMoveLeft: bigPosition - (0 @ 1)) ifTrue: [
			self moveLeft: bigPosition - (0 @ 1).
			bigPosition := bigPosition - (0 @ 1) ] ].
	direction = $> ifTrue: [
		(self canMoveRight: bigPosition + (0 @ 1)) ifTrue: [
			self moveRight: bigPosition + (0 @ 1).
			bigPosition := bigPosition + (0 @ 1) ] ].
	direction = $v ifTrue: [
		(self canMoveDown: bigPosition + (1 @ 0)) ifTrue: [
			self moveDown: bigPosition + (1 @ 0).
			bigPosition := bigPosition + (1 @ 0) ] ].
	direction = $^ ifTrue: [
		(self canMoveUp: bigPosition - (1 @ 0)) ifTrue: [
			self moveUp: bigPosition - (1 @ 0).
			bigPosition := bigPosition - (1 @ 0) ] ].
]

{ #category : 'moving' }
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

{ #category : 'moving' }
Day15Solver >> attemptMoveSelf: direction [

	| delta deltas nextSpot |
	deltas := Dictionary newFromPairs: { $> . (0 @ 1) . $< . (0 @ -1) . $^ . (-1 @ 0) . $v . (1 @ 0) }.
	delta := deltas at: direction.
	nextSpot := currentPosition + delta.
	(maze atPoint: nextSpot) = $.
		ifTrue: [ currentPosition := currentPosition + delta ]
		ifFalse: [
			(maze atPoint: nextSpot) = $O ifTrue: [
				(self attemptMoveBox: currentPosition + delta direction: delta)
					ifTrue: [ currentPosition := currentPosition + delta ] ] ]
]

{ #category : 'testing' }
Day15Solver >> canMoveDown: aPoint [

	(bigMaze atPoint: aPoint) = $. ifTrue: [ ^ true ].
	(bigMaze atPoint: aPoint) = $# ifTrue: [ ^ false ].
	(bigMaze atPoint: aPoint) = $] ifTrue: [
		^ self canMoveDown: aPoint - (0 @ 1) ].
	^ (self canMoveDown: aPoint + (1 @ 0)) and: (self canMoveDown: aPoint + (1 @ 1)).
]

{ #category : 'testing' }
Day15Solver >> canMoveLeft: aPoint [ 

	(bigMaze atPoint: aPoint) = $. ifTrue: [ ^ true ].
	(bigMaze atPoint: aPoint) = $# ifTrue: [ ^ false ].
	^ self canMoveLeft: aPoint + (0 @ -2).
]

{ #category : 'testing' }
Day15Solver >> canMoveRight: aPoint [

	(bigMaze atPoint: aPoint) = $. ifTrue: [ ^ true ].
	(bigMaze atPoint: aPoint) = $# ifTrue: [ ^ false ].
	^ self canMoveRight: aPoint + (0 @ 2).
]

{ #category : 'testing' }
Day15Solver >> canMoveUp: aPoint [

	(bigMaze atPoint: aPoint) = $. ifTrue: [ ^ true ].
	(bigMaze atPoint: aPoint) = $# ifTrue: [ ^ false ].
	(bigMaze atPoint: aPoint) = $] ifTrue: [
		^ self canMoveUp: aPoint - (0 @ 1) ].
	^ (self canMoveUp: aPoint + (-1 @ 0)) and: (self canMoveUp: aPoint + (-1 @ 1)).
]

{ #category : 'generating' }
Day15Solver >> makeBigMaze [

	bigMaze := Array2D
		           rows: maze numberOfRows
		           columns: maze numberOfColumns * 2.
	maze withIndicesDo: [ :v :r :c |
		v = $#
			ifTrue: [
				bigMaze at: r at: 2 * c put: $#.
				bigMaze at: r at: 2 * c - 1 put: $# ]
			ifFalse: [
				v = $.
					ifTrue: [
						bigMaze at: r at: 2 * c put: $..
						bigMaze at: r at: 2 * c - 1 put: $. ]
					ifFalse: [
						bigMaze at: r at: 2 * c put: $].
						bigMaze at: r at: 2 * c - 1 put: $[ ] ] ]
]

{ #category : 'moving' }
Day15Solver >> moveDown: aPoint [

	(bigMaze atPoint: aPoint ifInvalid: $#) = $] ifTrue: [ ^ self moveDown: (aPoint - (0@ 1)) ].
	(bigMaze atPoint: aPoint ifInvalid: $#) = $[ ifFalse: [ ^ self ].
	self moveDown: aPoint + (1 @ 0).
	self moveDown: aPoint + (1 @ 1).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: (aPoint y + 1) put: $..
	bigMaze at: (aPoint x + 1) at: aPoint y put: $[.
	bigMaze at: (aPoint x + 1) at: aPoint y + 1 put: $]
]

{ #category : 'moving' }
Day15Solver >> moveLeft: aPoint [ 

	(bigMaze atPoint: aPoint ifInvalid: $#) = $] ifFalse: [ ^ self ].
	self moveLeft: aPoint + (0 @ -2).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: (aPoint y - 1) put: $].
	bigMaze at: aPoint x at: (aPoint y - 2) put: $[
]

{ #category : 'moving' }
Day15Solver >> moveRight: aPoint [

	(bigMaze atPoint: aPoint ifInvalid: $#) = $[ ifFalse: [ ^ self ].
	self moveRight: aPoint + (0 @ 2).
	bigMaze at: aPoint x at: aPoint y put: $..
	bigMaze at: aPoint x at: aPoint y + 1 put: $[.
	bigMaze at: aPoint x at: aPoint y + 2 put: $]
]

{ #category : 'moving' }
Day15Solver >> moveUp: aPoint [
		
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
