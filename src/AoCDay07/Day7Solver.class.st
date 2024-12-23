"
I am a solver for day 7 of Advent of Code 2024
"
Class {
	#name : 'Day7Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'equations'
	],
	#category : 'AoCDay07',
	#package : 'AoCDay07'
}

{ #category : 'parsing' }
Day7Solver >> parseRawData [

	equations := rawData lines collect: [ :eqString | Day7Equation newFromString: eqString ]
]

{ #category : 'solving' }
Day7Solver >> solvePart1 [

	^ ((equations select: [ :eq | eq canBeSolved: { #+. #* } ]) collect: #testValue) sum
]

{ #category : 'solving' }
Day7Solver >> solvePart2 [

	^ ((equations select: [ :eq | eq canBeSolved: { #+. #*. #|| } ]) collect: #testValue) sum
]
