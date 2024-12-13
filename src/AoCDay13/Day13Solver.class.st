"
I am a solver for day 13 of Advent of Code 2024
"
Class {
	#name : 'Day13Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'machines'
	],
	#category : 'AoCDay13',
	#package : 'AoCDay13'
}

{ #category : 'parsing' }
Day13Solver >> parseRawData [

	machines := ('<n><n>' expandMacros split: rawData) collect: [ :machineString | Day13Machine newFromString: machineString ]
]

{ #category : 'solving' }
Day13Solver >> solvePart1 [

	^ (machines collect: [ :machine | machine tokensToWin]) sum
]

{ #category : 'solving' }
Day13Solver >> solvePart2 [

	^ (machines collect: [ :machine | machine tokensToWinAlt]) sum
]
