"
I am a collection of page numbers
"
Class {
	#name : 'Day5Update',
	#superclass : 'Object',
	#instVars : [
		'pageNumbers'
	],
	#category : 'AoCDay5',
	#package : 'AoCDay5'
}

{ #category : 'instance creation' }
Day5Update class >> newFromString: aString [
	^ self new pageNumbers: ((',' split: aString) collect: [ :x | x asInteger ])
]

{ #category : 'accessing' }
Day5Update >> middlePageNumber [
	^ pageNumbers at: ((pageNumbers size) / 2) ceiling
]

{ #category : 'accessing' }
Day5Update >> pageNumbers: aCollection [ 
	pageNumbers := aCollection
]

{ #category : 'verifying' }
Day5Update >> satisfies: aDay5Rule [ 
	| idx1 idx2 |
	idx1 := pageNumbers indexOf: (aDay5Rule first).
	idx2 := pageNumbers indexOf: (aDay5Rule second).
	^ idx1 = 0 or: (idx2 = 0 or: idx1 < idx2)
]

{ #category : 'sorting' }
Day5Update >> sortWith: aRuleset [
	pageNumbers sort: [ :a :b | aRuleset includes: (OrderedCollection with: a with: b) ].
]
