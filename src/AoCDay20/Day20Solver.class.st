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

{ #category : 'as yet unclassified' }
Day20Solver >> buildEndDistance [

	| curr dist |
	endDistance := Dictionary new.
	curr := Set new.
	curr add: endPos.
	dist := 0.

	[ curr isEmpty ] whileFalse: [
		curr do: [ :pos | endDistance at: pos put: dist ].
		dist := dist + 1.
		curr := ((curr flatCollect: [ :pos | pos fourNeighbors ]) select: [
			         :pos | self canMove: pos ]) reject: [ :pos |
			        endDistance includesKey: pos ] ]
]

{ #category : 'testing' }
Day20Solver >> canMove: pos [

	^ (pos between: 1 @ 1 and: height @ width) and: [ (walls includes: pos) not ]
]

{ #category : 'accessing' }
Day20Solver >> goal: anObject [

	goal := anObject
]

{ #category : 'as yet unclassified' }
Day20Solver >> neighborsOf: aPoint distance: anInteger [

	| neighbors |
	neighbors := OrderedCollection new.
	(aPoint x - anInteger) to: (aPoint x + anInteger) do: [ :r |
		(aPoint y - anInteger) to: (aPoint y + anInteger) do: [ :c |
			((self canMove: r @ c ) and: [ (aPoint manhattanDistanceTo: (r @ c)) <= anInteger ]) ifTrue: [ neighbors add: r @ c].
	] ].
	^ neighbors
]

{ #category : 'parsing' }
Day20Solver >> parseRawData [

	| lines val |
	lines := rawData lines.
	height := lines size.
	width := (lines at: 1) size.
	walls := Set new.
	1 to: height do: [ :r |
		1 to: width do: [ :c |
			val := (lines at: r) at: c.
			val = $# ifTrue: [ walls add: r @ c ].
			val = $S ifTrue: [ startPos := r @ c ].
			val = $E ifTrue: [ endPos := r @ c ] ] ].
	self buildEndDistance.
]

{ #category : 'solving' }
Day20Solver >> solvePart1 [

	^ self solveWithJumpSize: 2
]

{ #category : 'solving' }
Day20Solver >> solvePart2 [

	^ self solveWithJumpSize: 20
]

{ #category : 'as yet unclassified' }
Day20Solver >> solveWithJumpSize: jumpSize [

	| currPos count seen neighbors cheatValues cheatCounts |
	currPos := startPos.
	count := 0.
	seen := Set new.
	cheatCounts := Dictionary new.
	[ currPos ~= endPos ] whileTrue: [
		seen add: currPos.
		neighbors := self neighborsOf: currPos distance: jumpSize.
		cheatValues := neighbors collect: [ :jumpTo | (endDistance at: currPos) - (endDistance at: jumpTo) - (currPos manhattanDistanceTo: jumpTo) ].
		count := count  + (cheatValues count: [ :cheatVal | cheatVal >= goal ]).
		currPos := (currPos fourNeighbors select: [ :pos | (self canMove: pos) and: [ (seen includes: pos) not ] ]) first.
		].

	^ count
]
