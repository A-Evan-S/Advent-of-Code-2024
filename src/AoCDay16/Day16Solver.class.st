"
I am a solver for day 16 of Advent of Code 2024
"
Class {
	#name : 'Day16Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'maze',
		'start',
		'end',
		'costs'
	],
	#category : 'AoCDay16',
	#package : 'AoCDay16'
}

{ #category : 'accessing' }
Day16Solver >> directionToDelta: anInteger [

	^ { (0 @ 1). (1 @ 0). (0 @ -1). (-1 @ 0) } at: anInteger + 1
]

{ #category : 'accessing' }
Day16Solver >> endPositions [

	^ (0 to: 3) collect: [ :z | end @ z ] thenSelect: [ :endPos | costs includesKey: endPos ]
]

{ #category : 'accessing' }
Day16Solver >> getBackwards: currPos [

	^ currPos - ((self directionToDelta: currPos z) @ 0)
]

{ #category : 'accessing' }
Day16Solver >> getLeft: currPos [ 
	
	^ G3DCoordinates x: currPos x y: currPos y z: currPos z - 1 % 4
]

{ #category : 'accessing' }
Day16Solver >> getNeighbors: currPos [

	| nextPositions delta |
	nextPositions := OrderedCollection new.
	delta := self directionToDelta: currPos z.
	(maze atPoint: (currPos x @ currPos y) + delta) = $. ifTrue: [ nextPositions add: currPos + (delta @ 0) ].
	nextPositions add: (G3DCoordinates x: currPos x y: currPos y z: currPos z + 1 % 4).
	nextPositions add: (G3DCoordinates x: currPos x y: currPos y z: currPos z - 1 % 4).
	^ nextPositions
]

{ #category : 'accessing' }
Day16Solver >> getPreviousNeighbors: currPos [

	| prevNeighbors backwards left right |
	prevNeighbors := OrderedCollection new.
	backwards := self getBackwards: currPos.
	left := self getLeft: currPos.
	right := self getRight: currPos.
	(costs at: backwards ifAbsent: [ Float infinity ]) = ((costs at: currPos) - 1) ifTrue: [ prevNeighbors add: backwards ].
	(costs at: left ifAbsent: [ Float infinity ]) = ((costs at: currPos) - 1000) ifTrue: [ prevNeighbors add: left ].
	(costs at: right ifAbsent: [ Float infinity ]) = ((costs at: currPos) - 1000) ifTrue: [ prevNeighbors add: right ].
	^ prevNeighbors
]

{ #category : 'accessing' }
Day16Solver >> getRight: currPos [ 
	
	^ currPos x @ currPos y @ (currPos z + 1 % 4)
]

{ #category : 'parsing' }
Day16Solver >> parseRawData [

	| mazeLines |
	mazeLines := rawData lines.
	maze := Array2D rows: mazeLines size columns: (mazeLines first size).
	maze indicesDo: [ :r :c | maze at: r at: c put: ((mazeLines at: r) at: c) ].
	start := maze indexOf: $S.
	end := maze indexOf: $E.
	maze atPoint: start put: $..
	maze atPoint: end put: $..
	costs := Dictionary new.
]

{ #category : 'solving' }
Day16Solver >> solvePart1 [

	| queue currPos newCost startingPos |
	queue := Heap sortBlock: [ :pos1 :pos2 | (costs at: pos1) < (costs at: pos2) ].
	startingPos := start x @ start y @ 0.
	costs at: startingPos put: 0.
	queue add: startingPos.
	[ queue isNotEmpty ] whileTrue: [
		currPos := queue removeFirst.
		(self getNeighbors: currPos)
			select: [ :nextPos | (costs includesKey: nextPos) not ]
			thenDo: [ :nextPos |
				newCost := currPos z = nextPos z
					           ifTrue: [ (costs at: currPos) + 1 ]
					           ifFalse: [ (costs at: currPos) + 1000 ].
				((costs includesKey: nextPos) not or: [ (costs at: nextPos) > newCost ]) ifTrue: [
					costs at: nextPos put: newCost.
					queue add: nextPos ] ] ].
	^ (self endPositions collect: [ :endPos | costs at: endPos ]) min
]

{ #category : 'solving' }
Day16Solver >> solvePart2 [

	| seats queue currPos minCost |
	seats := Set new.
	minCost := self solvePart1.
	self endPositions
		select: [ :endPos | (costs at: endPos) = minCost ]
		thenDo: [ :endPos |
			queue := OrderedCollection new.
			queue add: endPos.
			[ queue isNotEmpty ] whileTrue: [
				currPos := queue removeFirst.
				seats add: currPos x @ currPos y.
				queue addAll: (self getPreviousNeighbors: currPos) ] ].
	^ seats size
]
