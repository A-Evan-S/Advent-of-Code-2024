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
	#category : 'AoCDay1',
	#package : 'AoCDay1'
}

{ #category : 'instance creation' }
Day1Solver class >> newFromFilename: filename [
	^ self new rawData: filename asFileReference contents lines; parseRawData
]

{ #category : 'instance creation' }
Day1Solver class >> newFromString: aString [
	^ self new rawData: aString lines; parseRawData
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

{ #category : 'parsing' }
Day1Solver >> parseRawData [
	leftList := self rawData collect: [ :s | ((s findTokens: ' ') at: 1) asNumber].
	rightList := self rawData collect: [ :s | ((s findTokens: ' ') at: 2) asNumber].
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
