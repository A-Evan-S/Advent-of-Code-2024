"
Solver for day 1 of Advent of Code 2024
"
Class {
	#name : 'Day1Solver',
	#superclass : 'Object',
	#instVars : [
		'rawData',
		'leftList',
		'rightList'
	],
	#category : 'AoCDay1',
	#package : 'AoCDay1'
}

{ #category : 'instance creation' }
Day1Solver class >> newFromFilename: filename [
	| solver |
	solver := self new rawData: filename asFileReference contents lines.
	solver parseRawData.
	^ solver
]

{ #category : 'instance creation' }
Day1Solver class >> newFromString: aString [
	| solver |
	solver := self new rawData: aString lines.
	solver parseRawData.
	^ solver
]

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

{ #category : 'processing' }
Day1Solver >> parseRawData [
	leftList := rawData collect: [ :s | ((s findTokens: ' ') at: 1) asNumber].
	rightList := rawData collect: [ :s | ((s findTokens: ' ') at: 2) asNumber].
]

{ #category : 'accessing' }
Day1Solver >> rawData [

	^ rawData
]

{ #category : 'accessing' }
Day1Solver >> rawData: anObject [

	rawData := anObject
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
