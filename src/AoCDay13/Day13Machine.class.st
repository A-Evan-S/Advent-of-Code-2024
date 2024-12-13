"
I represent a claw machine with two buttons
"
Class {
	#name : 'Day13Machine',
	#superclass : 'Object',
	#instVars : [
		'aButton',
		'bButton',
		'prizeLocation',
		'prizeLocationAlt'
	],
	#category : 'AoCDay13',
	#package : 'AoCDay13'
}

{ #category : 'instance creation' }
Day13Machine class >> newFromString: aString [

	| machine re nums |
	machine := self new.
	re := '\d+' asRegex.
	nums := (re matchesIn: aString) collect: #asInteger.
	machine aButton: nums first @ nums second.
	machine bButton: nums third @ nums fourth.
	machine prizeLocation: nums fifth @ nums sixth.
	machine prizeLocationAlt: machine prizeLocation + 10000000000000.
	^ machine
]

{ #category : 'accessing' }
Day13Machine >> aButton: anObject [

	aButton := anObject
]

{ #category : 'accessing' }
Day13Machine >> bButton: anObject [

	bButton := anObject
]

{ #category : 'accessing' }
Day13Machine >> prizeLocation [

	^ prizeLocation
]

{ #category : 'accessing' }
Day13Machine >> prizeLocation: anObject [

	prizeLocation := anObject
]

{ #category : 'accessing' }
Day13Machine >> prizeLocationAlt: anObject [

	prizeLocationAlt := anObject
]

{ #category : 'accessing' }
Day13Machine >> tokensToWin [

	0 to: 100 do: [ :aPresses |
		0 to: 100 do: [ :bPresses |
			aPresses * aButton + (bPresses * bButton) = prizeLocation ifTrue: [
				^ 3 * aPresses + bPresses ] ] ].
	^ 0
]

{ #category : 'accessing' }
Day13Machine >> tokensToWinAlt [

	| aPresses bPresses |
	bPresses := aButton x * prizeLocationAlt y - (aButton y * prizeLocationAlt x) / (aButton x * bButton y - (aButton y * bButton x)).
	aPresses := prizeLocationAlt x - (bButton x * bPresses) / aButton x.
	(aPresses isInteger and: bPresses isInteger) ifTrue: [ ^ 3 * aPresses + bPresses ].
	^ 0
]
