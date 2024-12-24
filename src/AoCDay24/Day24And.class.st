"
I am an AND operator with two inputs
"
Class {
	#name : 'Day24And',
	#superclass : 'Day24Element',
	#instVars : [
		'inElement1',
		'inElement2'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'accessing' }
Day24And >> inElement1: anObject [

	inElement1 := anObject
]

{ #category : 'accessing' }
Day24And >> inElement2: anObject [

	inElement2 := anObject
]

{ #category : 'accessing' }
Day24And >> output [
	^ (inElement1 output) bitAnd: (inElement2 output)
]
