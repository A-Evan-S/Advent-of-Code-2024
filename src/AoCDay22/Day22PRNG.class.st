"
I am a buyer monkey PRNG
"
Class {
	#name : 'Day22PRNG',
	#superclass : 'Object',
	#instVars : [
		'startingNumber',
		'currentNumber',
		'deltaHistory'
	],
	#category : 'AoCDay22',
	#package : 'AoCDay22'
}

{ #category : 'accessing' }
Day22PRNG >> currentNumber [

	^ currentNumber
]

{ #category : 'accessing' }
Day22PRNG >> deltaHistory [

	^ deltaHistory
]

{ #category : 'initialization' }
Day22PRNG >> initialize [

   startingNumber := 0.
   deltaHistory := OrderedCollection new
]

{ #category : 'accessing' }
Day22PRNG >> next [

   | oldPrice |
   oldPrice := self price.
   currentNumber := (currentNumber << 6 bitXor: currentNumber) % (1 << 24).
   currentNumber := (currentNumber >> 5 bitXor: currentNumber) % (1 << 24).
   currentNumber := (currentNumber << 11 bitXor: currentNumber) % (1 << 24).
   deltaHistory add: self price - oldPrice.
   deltaHistory size > 4 ifTrue: [ deltaHistory removeFirst ].
   ^ currentNumber
]

{ #category : 'accessing' }
Day22PRNG >> price [

	^ currentNumber rem: 10
]

{ #category : 'accessing' }
Day22PRNG >> startingNumber: anObject [

	startingNumber := anObject.
	currentNumber := anObject
]
