"
I am a computer with connections to other computers
"
Class {
	#name : 'Day23Computer',
	#superclass : 'Object',
	#instVars : [
		'name',
		'neighbors'
	],
	#category : 'AoCDay23',
	#package : 'AoCDay23'
}

{ #category : 'adding' }
Day23Computer >> addNeighbor: aDay23Computer [ 
	neighbors add: aDay23Computer
]

{ #category : 'testing' }
Day23Computer >> hasNeighbor: aDay23Computer [ 
	^ neighbors includes: aDay23Computer 
]

{ #category : 'initialization' }
Day23Computer >> initialize [

   neighbors := OrderedCollection new.
]

{ #category : 'accessing' }
Day23Computer >> name [

	^ name
]

{ #category : 'accessing' }
Day23Computer >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
Day23Computer >> neighbors [

	^ neighbors
]
