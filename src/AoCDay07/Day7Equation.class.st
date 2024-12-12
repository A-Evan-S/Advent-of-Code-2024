"
I represent an integer equation with missing operators
"
Class {
	#name : 'Day7Equation',
	#superclass : 'Object',
	#instVars : [
		'testValue',
		'terms'
	],
	#category : 'AoCDay07',
	#package : 'AoCDay07'
}

{ #category : 'instance creation' }
Day7Equation class >> newFromString: aString [ 
	| parts terms |
	parts := aString splitOn: ': '.
	terms := (parts second splitOn: ' ') collect: #asInteger.
	^ self new testValue: parts first asInteger; terms: terms
]

{ #category : 'testing' }
Day7Equation >> canBeSolved: operators [

	| totals |
	totals := { terms first }.
	terms allButFirstDo: [ :term |
		totals := (operators collect: [ :op |
			           totals collect: [ :prev | prev perform: op with: term ] ])
			          flattened select: [ :x | x <= testValue ] ].
	^ totals includes: testValue
]

{ #category : 'accessing' }
Day7Equation >> terms [

	^ terms
]

{ #category : 'accessing' }
Day7Equation >> terms: anObject [

	terms := anObject
]

{ #category : 'accessing' }
Day7Equation >> testValue [

	^ testValue
]

{ #category : 'accessing' }
Day7Equation >> testValue: anObject [

	testValue := anObject
]
