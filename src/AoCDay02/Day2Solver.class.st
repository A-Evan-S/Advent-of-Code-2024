"
I am a solver for day 2 of Advent of Code 2024
"
Class {
	#name : 'Day2Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'reports'
	],
	#category : 'AoCDay02',
	#package : 'AoCDay02'
}

{ #category : 'parsing' }
Day2Solver >> parseRawData [
	reports := rawData lines collect: [ :s | Day2Report newFromString: s].
]

{ #category : 'accessing' }
Day2Solver >> reports [
	^ reports
]

{ #category : 'accessing' }
Day2Solver >> reports: anObject [
	reports := anObject
]

{ #category : 'solving' }
Day2Solver >> solvePart1 [
	^ reports count: [ :report | report isSafe ]
]

{ #category : 'solving' }
Day2Solver >> solvePart2 [
	^ reports count: [ :report | report isNearlySafe ]
]
