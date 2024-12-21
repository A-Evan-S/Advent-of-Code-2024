"
I am a solver for day 21 of Advent of Code 2024
"
Class {
	#name : 'Day21Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'codes'
	],
	#category : 'AoCDay21',
	#package : 'AoCDay21'
}

{ #category : 'solving' }
Day21Solver >> complexityOf: code withDirectionalPadCount: n [

	| numPart numericSequences sequenceLengths directionPad numericPad |
	directionPad := Day21DirectionalKeypad new.
	numericPad := Day21NumericKeypad new.
	numericSequences := numericPad fullPathOptions: code.
	sequenceLengths := numericSequences collect: [ :seq | directionPad fullPathCost: seq withLayers: n ].
	numPart := code allButLast asInteger.
	^ sequenceLengths min * numPart
]

{ #category : 'parsing' }
Day21Solver >> parseRawData [

	codes := rawData lines
]

{ #category : 'solving' }
Day21Solver >> solvePart1 [

	^ codes collectAndSum: [ :code | self complexityOf: code withDirectionalPadCount: 2 ]
]

{ #category : 'solving' }
Day21Solver >> solvePart2 [

	^ codes collectAndSum: [ :code | self complexityOf: code withDirectionalPadCount: 25 ]
]
