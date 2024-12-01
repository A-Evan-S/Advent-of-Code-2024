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
	^ self new rawData: filename asFileReference contents lines
]

{ #category : 'instance creation' }
Day1Solver class >> newFromString: aString [
	^ self new rawData: aString lines
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
Day1Solver >> solvePart1 [
	self sortLeft; sortRight.
	^ (leftList with: rightList collect: [ :l :r | (l - r) abs ]) sum
	
]

{ #category : 'accessing' }
Day1Solver >> solvePart2 [
	^ (leftList collect: [ :x | x * (self countRightOccurrences: x) ]) sum
]

{ #category : 'sorting' }
Day1Solver >> sortLeft [
	leftList := leftList sorted
]

{ #category : 'sorting' }
Day1Solver >> sortRight [
	rightList := rightList sorted
]
