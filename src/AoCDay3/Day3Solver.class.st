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

{ #category : 'solving' }
Day3Solver >> evalMul: aString [ 
	| idx val1 val2 |
	idx := aString indexOf: $,.
	val1 := (aString copyFrom: 5 to: idx) asNumber.
	val2 := (aString copyFrom: (idx + 1) to: (aString size - 1)) asNumber.
	^ val1 * val2
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
