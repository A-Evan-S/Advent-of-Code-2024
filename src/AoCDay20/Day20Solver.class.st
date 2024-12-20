"
I am a solver for day 20 of Advent of Code 2024
"
Class {
	#name : 'Day20Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'startPos',
		'endPos',
		'walls',
		'goal',
		'width',
		'height',
		'endDistance'
	],
	#category : 'AoCDay20',
	#package : 'AoCDay20'
}

{ #category : 'building' }
Day20Solver >> buildEndDistance [

	| curr dist |
	endDistance := Dictionary new.
	curr := Set newFrom: { endPos }.
	dist := 0.
	[ curr isEmpty ] whileFalse: [
		curr do: [ :pos | endDistance at: pos put: dist ].
		dist := dist + 1.
		curr := ((curr flatCollect: [ :pos | pos fourNeighbors ])
			select: [ :pos | self canMove: pos ]) 
			reject: [ :pos | endDistance includesKey: pos ] ]
]

{ #category : 'testing' }
Day20Solver >> canMove: pos [

	^ (pos between: 1 @ 1 and: height @ width) and: [ (walls includes: pos) not ]
]

{ #category : 'accessing' }
Day20Solver >> goal: anObject [

	goal := anObject
]

{ #category : 'accessing' }
Day20Solver >> neighborsOf: aPoint distance: dist [

	| neighbors |
	neighbors := (aPoint x - dist to: aPoint x + dist) flatCollect: [ :r |
		             (aPoint y - dist to: aPoint y + dist) collect: [ :c | r @ c ] ].
	^ neighbors select: [ :pos | (self canMove: pos) and: [ (aPoint manhattanDistanceTo: pos) <= dist ] ]
]

{ #category : 'parsing' }
Day20Solver >> parseRawData [

	height := rawData lines size.
	width := (rawData lines at: 1) size.
	walls := Set new.
	rawData lines withIndexDo: [ :row :r |
		row withIndexDo: [ :val :c |
			val = $# ifTrue: [ walls add: r @ c ].
			val = $S ifTrue: [ startPos := r @ c ].
			val = $E ifTrue: [ endPos := r @ c ] ] ].
	self buildEndDistance
]

{ #category : 'solving' }
Day20Solver >> solvePart1 [

	^ self solveWithJumpSize: 2
]

{ #category : 'solving' }
Day20Solver >> solvePart2 [

	^ self solveWithJumpSize: 20
]

{ #category : 'solving' }
Day20Solver >> solveWithJumpSize: jumpSize [

	| cheatValues jumpStarts |
	jumpStarts := (1 to: height) flatCollect: [ :r | (1 to: width) collect: [ :c | r @ c ] ].
	jumpStarts := jumpStarts select: [ :pos | self canMove: pos ].
	cheatValues := jumpStarts flatCollect: [ :jumpStart |
		               (self neighborsOf: jumpStart distance: jumpSize) collect: [ :jumpEnd |
				               (endDistance at: jumpStart)
				               - (endDistance at: jumpEnd)
				               - (jumpStart manhattanDistanceTo: jumpEnd) ] ].
	^ cheatValues count: [ :cheatVal | cheatVal >= goal ]
]
