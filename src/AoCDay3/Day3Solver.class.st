"
I am a solver for day 3 of Advent of Code 2024
"
Class {
	#name : 'Day3Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'operations'
	],
	#category : 'AoCDay3',
	#package : 'AoCDay3'
}

{ #category : 'evaluating' }
Day3Solver >> evalMul: aString [ 
	| re |
	re := 'mul\((\d{1,3}),(\d{1,3})\)' asRegex.
	re matches: aString.
	^ ((re subexpression: 2) asNumber) * ((re subexpression: 3) asNumber)
]

{ #category : 'parsing' }
Day3Solver >> parseRawData [
	operations := rawData regex: 'mul\(\d{1,3},\d{1,3}\)|do\(\)|don''t\(\)' matchesCollect: [ :x | x ]
]

{ #category : 'solving' }
Day3Solver >> solvePart1 [
	| mulOps |
	mulOps := operations select: [ :op | op beginsWith: 'mul' ].
	^ (mulOps collect: [ :mulOp | self evalMul: mulOp ]) sum
]

{ #category : 'solving' }
Day3Solver >> solvePart2 [
	| total shouldMul |
	total := 0.
	shouldMul := true.
	operations do: [ :op |
		((op beginsWith: 'mul') and: shouldMul)
			ifTrue: [ total := total + (self evalMul: op) ]
			ifFalse: [ shouldMul := op = 'do()' ] ].
	^ total
]
