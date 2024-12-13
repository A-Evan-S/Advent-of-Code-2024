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

	| l1 l2 result |
	l1 := GLine a: aButton x b: bButton x c: prizeLocationAlt x negated.
	l2 := GLine a: aButton y b: bButton y c: prizeLocationAlt y negated.
	result := (l1 intersectionsWith: l2) first asPoint.
	^ result isIntegerPoint ifTrue: [ 3 * result x + result y ] ifFalse: [0]
]
