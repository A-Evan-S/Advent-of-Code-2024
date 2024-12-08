Class {
	#name : 'Day8Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'numRows',
		'numCols',
		'antennae',
		'frequencies'
	],
	#category : 'AoCDay8',
	#package : 'AoCDay8'
}

{ #category : 'parsing' }
Day8Solver >> parseRawData [

	| grid freq |
	grid := rawData lines.
	numRows := grid size.
	numCols := (grid at: 1) size.
	antennae := OrderedCollection new.
	frequencies := Set new.
	1 to: numRows do: [ :r |
		1 to: numCols do: [ :c |
			freq := (grid at: r) at: c.
			freq ~= $. ifTrue: [
				antennae add: (Day8Antenna new
						 position: r @ c;
						 frequency: freq).
				frequencies add: freq ] ] ].
]

{ #category : 'solving' }
Day8Solver >> solvePart1 [

	| antinodes |
	antinodes := Set new.
	frequencies do: [ :freq |
		(antennae select: [ :ant | ant frequency = freq ])
			combinations: 2
			atATimeDo: [ :nodePair |
				antinodes addAll: (nodePair first antinodesWith: nodePair second) ] ].
	antinodes := antinodes select: [ :node |
		             0 @ 0 < node and: node <= (numRows @ numCols) ].
	^ antinodes size
]

{ #category : 'solving' }
Day8Solver >> solvePart2 [
	| antinodes |
	antinodes := Set new.
	frequencies do: [ :freq |
		(antennae select: [ :ant | ant frequency = freq ])
			combinations: 2
			atATimeDo: [ :nodePair |
				antinodes addAll: (nodePair first antinodesWith: nodePair second upTo: (numRows@ numCols)) ] ].
	antinodes := antinodes select: [ :node |
		             0 @ 0 < node and: node <= (numRows @ numCols) ].
	^ antinodes size
]
