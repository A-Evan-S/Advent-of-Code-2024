"
Solver for day 1 of Advent of Code 2024
"
Class {
	#name : 'Day1Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'leftList',
		'rightList'
	],
	#category : 'AoCDay01',
	#package : 'AoCDay01'
}

{ #category : 'processing' }
Day1Solver >> countRightOccurrences: anInteger [ 
	^ (rightList select: [ :x | x == anInteger ]) size
]

{ #category : 'accessing' }
Day1Solver >> leftList [

	^ leftList
]

{ #category : 'accessing' }
Day1Solver >> leftList: anObject [

	leftList := anObject
]

{ #category : 'parsing' }
Day1Solver >> parseRawData [
	| numberPairs |
	numberPairs := self rawData lines collect: [ :s | s findTokens: ' ' ].
	leftList := numberPairs collect: [ :p | p first asNumber].
	rightList := numberPairs collect: [ :p | p second asNumber].
]

{ #category : 'accessing' }
Day1Solver >> rightList [

	^ rightList
]

{ #category : 'accessing' }
Day1Solver >> rightList: anObject [

	rightList := anObject
]

{ #category : 'solving' }
Day1Solver >> solvePart1 [
	leftList sort.
	rightList sort.
	^ (leftList with: rightList collect: [ :l :r | (l - r) abs ]) sum
	
]

{ #category : 'solving' }
Day1Solver >> solvePart2 [
	^ (leftList collect: [ :x | x * (self countRightOccurrences: x) ]) sum
]
