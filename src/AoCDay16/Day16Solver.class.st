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
Day16Solver >> endPositions [

	^ (0 to: 3)
		  collect: [ :z | G3DCoordinates x: end x y: end y z: z ]
		  thenSelect: [ :endPos | costs includesKey: endPos ]
]

{ #category : 'accessing' }
Day16Solver >> getBackwards: currPos [ 

	^ (Dictionary newFromPairs: {
		0 . currPos + (0@ -1 @ 0) .
		1 . currPos + (-1@ 0 @ 0) .
		2 . currPos + (0@ 1 @ 0) .
		3 . currPos + (1@ 0 @ 0) }) at: currPos z.
]

{ #category : 'accessing' }
Day16Solver >> getLeft: currPos [ 
	
	^ G3DCoordinates x: currPos x y: currPos y z: currPos z - 1 % 4
]

{ #category : 'accessing' }
Day16Solver >> getPossiblePositions: currPos [

	| nextPositions |
	nextPositions := OrderedCollection new.
	currPos z = 0 ifTrue: [
		((maze atPoint: currPos x @ currPos y + (0 @ 1)) = $.) ifTrue: [ nextPositions add: currPos + (0@1@0) ].
	 ].
	currPos z = 1 ifTrue: [
		((maze atPoint: currPos x @ currPos y + (1 @ 0)) = $.) ifTrue: [ nextPositions add: currPos + (1@0@0) ].
	].
	currPos z = 2 ifTrue: [
		((maze atPoint: currPos x @ currPos y + (0 @ -1)) = $.) ifTrue: [ nextPositions add: currPos + (0@ -1 @ 0) ].
	].
	currPos z = 3 ifTrue: [
		((maze atPoint: currPos x @ currPos y + (-1 @ 0)) = $.) ifTrue: [ nextPositions add: currPos + (-1@0@0) ].
	].
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
	
	^ G3DCoordinates x: currPos x y: currPos y z: currPos z + 1 % 4
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

	| queue currPos newCost visited startingPos |
	visited := Set new.
	queue := Heap sortBlock: [ :pos1 :pos2 | (costs at: pos1) < (costs at: pos2) ].
	startingPos := start x @ start y @ 0.
	costs at: startingPos put: 0.
	queue add: startingPos.
	[ queue isNotEmpty ] whileTrue: [
		currPos := queue removeFirst.
		visited add: currPos.
		(self getPossiblePositions: currPos)
			select: [ :nextPos | (visited includes: nextPos) not ]
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
