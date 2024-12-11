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

{ #category : 'as yet unclassified' }
Day11Solver >> blink: blinkCount timesStone: stone [ 
	
	| s firstHalf secondHalf |
	(blinkCount = 0) ifTrue: [^ 1].
	(stone = 0) ifTrue: [ ^ self cachedBlink: blinkCount - 1 timesStone: 1 ].
	s := stone asString.	
	(s size even) ifTrue: [
		firstHalf := (s first: (s size // 2)) asInteger.
		secondHalf := (s allButFirst: (s size // 2)) asInteger.
		^ (self cachedBlink: blinkCount - 1 timesStone: firstHalf) + (self cachedBlink: blinkCount - 1 timesStone: secondHalf) ].
	^ self cachedBlink: blinkCount - 1 timesStone: (stone * 2024)
]

{ #category : 'as yet unclassified' }
Day11Solver >> cachedBlink: blinkCount timesStone: stone [ 
	
	| key result |
	key := { blinkCount . stone }.
	(cache includesKey: key) ifTrue: [ ^ cache at: key ] ifFalse: [
		result := self blink: blinkCount timesStone: stone.
		cache at: key put: result.
		^ result
	]
]

{ #category : 'parsing' }
Day11Solver >> parseRawData [
	cache := Dictionary new.
	stones := (rawData splitOn: ' ') collect: #asInteger.
]

{ #category : 'solving' }
Day11Solver >> solvePart1 [
	^ (stones collect: [ :stone | self blink: 25 timesStone: stone ]) sum
]

{ #category : 'solving' }
Day11Solver >> solvePart2 [
	^ (stones collect: [ :stone | self blink: 75 timesStone: stone ]) sum
]
