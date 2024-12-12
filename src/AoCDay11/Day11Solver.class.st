"
I am a solver for day 11 of Advent of Code 2024
"
Class {
	#name : 'Day11Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'stones',
		'cache'
	],
	#category : 'AoCDay11',
	#package : 'AoCDay11'
}

{ #category : 'calculating' }
Day11Solver >> blink: blinkCount timesStone: stone [

	| s firstHalf secondHalf |
	blinkCount = 0 ifTrue: [ ^ 1 ].
	stone = 0 ifTrue: [ ^ self cachedBlink: blinkCount - 1 timesStone: 1 ].
	s := stone asString.
	s size even ifTrue: [
		firstHalf := (s first: s size // 2) asInteger.
		secondHalf := (s allButFirst: s size // 2) asInteger.
		^ (self cachedBlink: blinkCount - 1 timesStone: firstHalf)
		  + (self cachedBlink: blinkCount - 1 timesStone: secondHalf) ].
	^ self cachedBlink: blinkCount - 1 timesStone: stone * 2024
]

{ #category : 'calculating' }
Day11Solver >> cachedBlink: blinkCount timesStone: stone [

	| key |
	key := { blinkCount . stone }.
	(cache includesKey: key)
		ifTrue: [ ^ cache at: key ]
		ifFalse: [ ^ cache at: key put: (self blink: blinkCount timesStone: stone). ]
]

{ #category : 'parsing' }
Day11Solver >> parseRawData [
	cache := Dictionary new.
	stones := (rawData splitOn: ' ') collect: #asInteger.
]

{ #category : 'solving' }
Day11Solver >> solvePart1 [
	^ (stones collect: [ :stone | self cachedBlink: 25 timesStone: stone ]) sum
]

{ #category : 'solving' }
Day11Solver >> solvePart2 [
	^ (stones collect: [ :stone | self cachedBlink: 75 timesStone: stone ]) sum
]
