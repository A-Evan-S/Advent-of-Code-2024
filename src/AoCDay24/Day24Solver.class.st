"
I am a solver for day 24 of Advent of Code 2024
"
Class {
	#name : 'Day24Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'elements',
		'intendedOperation',
		'swapped'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'accessing' }
Day24Solver >> expected [

   | x y |
   x := self getNum: $x.
   y := self getNum: $y.
   ^ x perform: intendedOperation with: y
]

{ #category : 'accessing' }
Day24Solver >> getNum: aCharacter [

	| numElements |
	numElements := elements keys sorted reverse select: [ :name | name first = aCharacter ].
	^ numElements inject: 0 into: [ :acc :name | acc << 1 + ((elements at: name) output) ]
]

{ #category : 'accessing' }
Day24Solver >> incorrectOutputBits [

   | incorrectBits expected actual i |
   incorrectBits := Set new.
   10 timesRepeat: [
      elements values
         select: [ :elem | 'xy' includes: elem name first ]
         thenDo: [ :elem | elem value: (0 to: 1) atRandom ].
      expected := self expected.
      actual := self getNum: $z.
      i := 0.
      [ expected > 0 | (actual > 0) ] whileTrue: [
         expected % 2 ~= (actual % 2) ifTrue: [ incorrectBits add: i ].
         expected := expected >> 1.
         actual := actual >> 1.
         i := i + 1 ] ].
   ^ incorrectBits sorted
]

{ #category : 'initialization' }
Day24Solver >> initialize [

	swapped := Set new.
]

{ #category : 'accessing' }
Day24Solver >> intendedOperation: anObject [

	intendedOperation := anObject
]

{ #category : 'parsing' }
Day24Solver >> parseRawData [

   | constants gates name pieces gate |
   constants := (rawData splitOn: String cr , String cr) first lines.
   elements := Dictionary new.
   constants do: [ :constString |
      name := (constString splitOn: ': ') first.
      elements at: name put: (Day24Constant new
             value: constString last digitValue;
             name: name) ].
   gates := (rawData splitOn: String cr , String cr) second lines.
   gates do: [ :gateString |
      pieces := gateString splitOn: ' '.
      name := pieces last.
      pieces second = 'AND' ifTrue: [ elements at: name put: (Day24And new name: name) ].
      pieces second = 'OR' ifTrue: [ elements at: name put: (Day24Or new name: name) ].
      pieces second = 'XOR' ifTrue: [ elements at: name put: (Day24Xor new name: name) ] ].
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

	self incorrectOutputBits ifEmpty: [ ^ self swapped ].
	^ 'Unsolved'
]

{ #category : 'correcting' }
Day24Solver >> swapOutput: aString1 with: aString2 [

	swapped remove: aString1 ifAbsent: [ swapped add: aString1 ].
	swapped remove: aString2 ifAbsent: [ swapped add: aString2 ].
   rawData := String cr join: (rawData lines collect: [ :line |
		(line endsWith: aString1) ifTrue: [ (line allButLast: 3) , aString2 ]
			ifFalse: [ (line endsWith: aString2) ifTrue: [ (line allButLast: 3) , aString1 ]
				ifFalse: [ line ] ] ]).
   self parseRawData
]

{ #category : 'accessing' }
Day24Solver >> swapped [

	^ ',' join: swapped sorted
]
