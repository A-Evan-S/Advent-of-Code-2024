"
I am an XOR operator with two inputs
"
Class {
	#name : 'Day24Xor',
	#superclass : 'Day24Element',
	#instVars : [
		'inElement1',
		'inElement2'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'accessing' }
Day24Xor >> inElement1: anObject [

	inElement1 := anObject
]

{ #category : 'accessing' }
Day24Xor >> inElement2: anObject [

	inElement2 := anObject
]

{ #category : 'accessing' }
Day24Xor >> output [
	^ (inElement1 output) bitXor: (inElement2 output)
]
