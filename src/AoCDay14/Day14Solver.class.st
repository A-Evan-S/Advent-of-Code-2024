"
I am a solver for day 14 of Advent of Code 2024
"
Class {
	#name : 'Day14Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'robots',
		'roomWidth',
		'roomHeight',
		'stepCount'
	],
	#category : 'AoCDay14',
	#package : 'AoCDay14'
}

{ #category : 'initialization' }
Day14Solver >> initialize [

	stepCount := 0.
]

{ #category : 'accessing' }
Day14Solver >> neighboringCount [

	| robotPositions neighborCount positionSet |
	robotPositions := (robots collect: #position).
	positionSet := robotPositions asSet.
	neighborCount := robotPositions collect: [ :pos | pos fourNeighbors count: [ :neighbor | positionSet includes: neighbor ] ].
	^ neighborCount sum
]

{ #category : 'parsing' }
Day14Solver >> parseRawData [

	robots := rawData lines collect: [ :line | Day14Robot newFromString: line ].
]

{ #category : 'accessing' }
Day14Solver >> roomSizeWidth: width height: height [

	roomWidth := width.
	roomHeight := height.
]

{ #category : 'accessing' }
Day14Solver >> safetyFactor [

	| midPoint robotPositions quadrantSizes |
	midPoint := roomWidth @ roomHeight // 2.
	robotPositions := robots collect: [ :robot | robot position - midPoint ].
	robotPositions := robotPositions  select: [ :pos | (pos x ~= 0) and: (pos y ~= 0) ].
	quadrantSizes := (robotPositions groupedBy: [ :pos | (0@0) quadrantOf: pos ]) values collect: #size.
	^ quadrantSizes inject: 1 into: [ :a :b | a * b ]
]

{ #category : 'solving' }
Day14Solver >> solvePart1 [

	100 timesRepeat: [ self stepRobots ].
	^ self safetyFactor
]

{ #category : 'solving' }
Day14Solver >> solvePart2 [

	[ self neighboringCount < 1000 ] whileTrue: [ self stepRobots ].
	^ stepCount
]

{ #category : 'updating' }
Day14Solver >> stepRobots [

	stepCount := stepCount + 1.
	robots do: [ :robot | robot stepWithWidth: roomWidth height: roomHeight ]
]
