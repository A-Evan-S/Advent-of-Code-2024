"
I am an element in a circuit
"
Class {
	#name : 'Day24Element',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'accessing' }
Day24Element >> name [

	^ name
]

{ #category : 'accessing' }
Day24Element >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
Day24Element >> output [
	^ self subclassResponsibility
]
