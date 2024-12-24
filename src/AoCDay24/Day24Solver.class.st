"
I am a solver for day 24 of Advent of Code 2024
"
Class {
	#name : 'Day24Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'elements',
		'intendedOperation'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'as yet unclassified' }
Day24Solver >> getNum: aCharacter [
	| numElements |
	numElements := elements keys sorted select: [ :name | name first = aCharacter ].
	^ numElements inject: 0 into: [ :acc :name | acc << 1 + ((elements at: name) output) ]
]

{ #category : 'parsing' }
Day24Solver >> parseRawData [

   | constants gates name pieces gate |

   constants := (rawData splitOn: String cr , String cr) first lines.
   elements := Dictionary new.
   constants do: [ :constString |
      name := (constString splitOn: ': ') first.
      elements at: name put: (constString last = $0
             ifTrue: [ Day24Constant newZero name: name ]
             ifFalse: [ Day24Constant newOne name: name ]) ].

   gates := (rawData splitOn: String cr , String cr) second lines.
   gates do: [ :gateString |
      pieces := gateString splitOn: ' '.
      name := pieces last.
      pieces second = 'AND' ifTrue: [ elements at: name put: (Day24And new name: name) ].
      pieces second = 'OR' ifTrue: [ elements at: name put: (Day24Or new name: name) ].
      pieces second = 'XOR' ifTrue: [ elements at: name put: (Day24Xor new name: name) ].
          ].
   gates do: [ :gateString |
      pieces := gateString splitOn: ' '.
      gate := elements at: pieces last.
      gate inElement1: (elements at: pieces first).
      gate inElement2: (elements at: pieces third) ]
]

{ #category : 'solving' }
Day24Solver >> solvePart1 [
	^ self getNum: $z
]

{ #category : 'solving' }
Day24Solver >> solvePart2 [
	^ 0
]
