"
I am a solver for day 8 of Advent of Code 2024
"
Class {
	#name : 'Day8Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'antennae',
		'frequencies',
		'bounds'
	],
	#category : 'AoCDay8',
	#package : 'AoCDay8'
}

{ #category : 'accessing' }
Day8Solver >> nodePairs [
	| pairs |
	pairs := OrderedCollection new.
	frequencies do: [ :freq |
		(antennae select: [ :ant | (ant frequency) = freq ])
			combinations: 2
			atATimeDo: [ :nodePair | pairs add: nodePair clone ]].
	^ pairs
]

{ #category : 'parsing' }
Day8Solver >> parseRawData [

	| grid freq numRows numCols |
	grid := rawData lines.
	numRows := grid size.
	numCols := (grid at: 1) size.
	antennae := OrderedCollection new.
	1 to: numRows do: [ :r |
		1 to: numCols do: [ :c |
			freq := (grid at: r) at: c.
			freq ~= $. ifTrue: [
				antennae add: (Day8Antenna new
						 position: r @ c;
						 frequency: freq) ] ] ].
	bounds := (1 @ 1) rectangle: (numRows + 1) @ (numCols + 1).
	frequencies := (antennae collect: #frequency) asSet
]

{ #category : 'solving' }
Day8Solver >> solvePart1 [

	^ (self nodePairs collect: [ :nodePair |
		   nodePair first
			   singleAntinodesWith: nodePair second
			   within: bounds ]) flattened asSet size
]

{ #category : 'solving' }
Day8Solver >> solvePart2 [

	^ (self nodePairs collect: [ :nodePair |
		   nodePair first allAntinodesWith: nodePair second within: bounds ])
		  flattened asSet size
]
