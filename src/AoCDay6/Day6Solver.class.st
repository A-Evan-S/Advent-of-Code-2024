"
I am a solver for day 5 of Advent of Code 2024
"
Class {
	#name : 'Day6Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'numRows',
		'numCols',
		'obstacles',
		'templateGuard'
	],
	#category : 'AoCDay6',
	#package : 'AoCDay6'
}

{ #category : 'adding' }
Day6Solver >> addObstacle: aPoint [
	(self inBounds: aPoint) ifTrue: [ obstacles add: aPoint ]
]

{ #category : 'checking' }
Day6Solver >> doesCycle [
	| guard visited nextPosition |
	guard := templateGuard clone.
	visited := Set new.
	[ self inBounds: (guard position) ] whileTrue: [ 
		nextPosition := (guard position + guard direction).
		(self hasObstacle: nextPosition) ifTrue: [
			(visited includes: guard) ifTrue: [ ^ true ].
			visited add: (guard clone).
			guard turnRight.
			] ifFalse: [ guard position: nextPosition ].
	].
	^ false
]

{ #category : 'testing' }
Day6Solver >> hasObstacle: aPoint [ 
	^ obstacles includes: aPoint
]

{ #category : 'ensure bounds' }
Day6Solver >> inBounds: aPoint [ 
	^ (aPoint x between: 1 and: numRows) and: (aPoint y between: 1 and: numCols)
]

{ #category : 'parsing' }
Day6Solver >> parseRawData [

	| grid guardPos |
	grid := rawData lines.
	numRows := grid size.
	numCols := (grid at: 1) size.
	obstacles := Set new.
	grid withIndexDo: [ :row :r |
		row withIndexDo: [ :x :c |
			x = $# ifTrue: [ obstacles add: r @ c ].
			x = $^ ifTrue: [ guardPos := r @ c ] ] ].
	templateGuard := (Day6Guard new position: guardPos) direction: -1 @ 0
]

{ #category : 'solving' }
Day6Solver >> solvePart1 [

	| guard visited nextPosition |
	guard := templateGuard clone.
	visited := Set new.
	[ self inBounds: guard position ] whileTrue: [
		visited add: guard position.
		nextPosition := guard position + guard direction.
		(self hasObstacle: nextPosition)
			ifTrue: [ guard turnRight ]
			ifFalse: [ guard position: nextPosition ] ].
	^ visited size
]

{ #category : 'solving' }
Day6Solver >> solvePart2 [

	| count |
	count := 0.
	1 to: numRows do: [ :r |
		1 to: numCols do: [ :c |
			(r @ c ~= templateGuard position and: (self hasObstacle: r @ c) not)
				ifTrue: [
					self addObstacle: r @ c.
					self doesCycle ifTrue: [ count := count + 1 ].
					obstacles remove: r @ c ] ] ].
	^ count
]
