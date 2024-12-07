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
	#category : 'AoCDay7',
	#package : 'AoCDay7'
}

{ #category : 'instance creation' }
Day7Equation class >> newFromString: aString [ 
	| equation |
	equation := self new.
	equation testValue: ((aString splitOn: ': ') first asInteger).
	equation terms: ((((aString splitOn: ': ') second) splitOn: ' ') collect: #asInteger).
	^ equation
]

{ #category : 'testing' }
Day7Equation >> canBeSolved: operators [

	| totals |
	totals := { terms first }.
	terms allButFirstDo: [ :term |
		totals := (operators collect:
			          [ :op |
			          totals collect: [ :prev | op value: prev value: term ] ])
				          flattened ].
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
