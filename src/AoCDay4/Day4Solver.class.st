"
I am a solver for day 3 of Advent of Code 2024
"
Class {
	#name : 'Day4Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'grid'
	],
	#category : 'AoCDay4',
	#package : 'AoCDay4'
}

{ #category : 'accessing' }
Day4Solver >> at: aPoint [
	^ grid at: (aPoint x) at: (aPoint y) ifInvalid: $..
]

{ #category : 'accessing' }
Day4Solver >> countXmasAt: aPoint [ 
	| directions |
	directions := {1@1 . 1@0 . 1@(-1) . 0@1 . 0@(-1) . (-1)@1 . (-1)@0 . (-1)@(-1)}.
	^ directions count: [ :delta | self isXmasAt: aPoint direction: delta ]
]

{ #category : 'accessing' }
Day4Solver >> isX_masAt: aPoint [ 
	| a b |
	a := String withAll: {(self at: aPoint - (1@1)) . (self at: aPoint) . (self at: aPoint + (1@1))}.
	b := String withAll: {(self at: aPoint - (-1@1)) . (self at: aPoint) . (self at: aPoint + (-1@1))}.
	^ ((a = 'MAS') or: (a = 'SAM')) and: ((b = 'MAS') or: (b = 'SAM'))
]

{ #category : 'accessing' }
Day4Solver >> isXmasAt: aPoint direction: aDirection [
	| tempPoint |
	^ (1 to: 4) allSatisfy: [ :i |
		  tempPoint := aPoint + (aDirection * (i - 1)).
		  (self at: tempPoint) = ('XMAS' at: i) ]
]

{ #category : 'parsing' }
Day4Solver >> parseRawData [
	| rows |
	rows := rawData lines.
	grid := Array2D rows: (rows size) columns: ((rows at: 1) size) tabulate: [ :r :c | (rows at: r) at: c ]
]

{ #category : 'solving' }
Day4Solver >> solvePart1 [
	^ grid
		  indicesInject: 0
		  into: [ :count :r :c | count + (self countXmasAt: r @ c) ]
]

{ #category : 'solving' }
Day4Solver >> solvePart2 [
	^ grid withIndicesInject: 0 into: [ :count :x :r :c | count + (self isX_masAt: r @ c) asInteger ]
]
