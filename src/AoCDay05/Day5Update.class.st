"
I am a collection of page numbers
"
Class {
	#name : 'Day5Update',
	#superclass : 'Object',
	#instVars : [
		'pageNumbers'
	],
	#category : 'AoCDay05',
	#package : 'AoCDay05'
}

{ #category : 'instance creation' }
Day5Update class >> newFromString: aString [
	^ self new pageNumbers: ((aString splitOn: $,) collect: [ :x | x asInteger ])
]

{ #category : 'accessing' }
Day5Update >> middlePageNumber [
	^ pageNumbers at: ((pageNumbers size + 1) // 2)
]

{ #category : 'accessing' }
Day5Update >> pageNumbers: aCollection [ 
	pageNumbers := aCollection
]

{ #category : 'verifying' }
Day5Update >> satisfies: aRule [ 
	| idx1 idx2 |
	idx1 := pageNumbers indexOf: (aRule first) ifAbsent: [ ^ true ].
	idx2 := pageNumbers indexOf: (aRule second) ifAbsent: [ ^ true ].
	^ idx1 < idx2
]

{ #category : 'sorting' }
Day5Update >> sortedWith: aRuleset [
	pageNumbers sort: [ :a :b | aRuleset includes: (OrderedCollection with: a with: b) ].
]
