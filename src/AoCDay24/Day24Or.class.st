"
I am an OR operator with two inputs
"
Class {
	#name : 'Day24Or',
	#superclass : 'Day24Element',
	#instVars : [
		'inElement1',
		'inElement2'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'accessing' }
Day24Or >> inElement1: anObject [

	inElement1 := anObject
]

{ #category : 'accessing' }
Day24Or >> inElement2: anObject [

	inElement2 := anObject
]

{ #category : 'accessing' }
Day24Or >> output [
	^ (inElement1 output) bitOr: (inElement2 output)
]
