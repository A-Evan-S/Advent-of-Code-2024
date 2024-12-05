"
I am a rule for the ordering of page numbers
"
Class {
	#name : 'Day5Rule',
	#superclass : 'Object',
	#instVars : [
		'first',
		'second'
	],
	#category : 'AoCDay5',
	#package : 'AoCDay5'
}

{ #category : 'instance creation' }
Day5Rule class >> newFromString: aString [
	| rule |
	rule := self new.
	rule first: (aString findTokens: '|') first asNumber.
	rule second: (aString findTokens: '|') second asNumber.
	^ rule
]

{ #category : 'accessing' }
Day5Rule >> first [
	^ first
]

{ #category : 'accessing' }
Day5Rule >> first: anInteger [ 
	first := anInteger
]

{ #category : 'accessing' }
Day5Rule >> second [
	^ second
]

{ #category : 'accessing' }
Day5Rule >> second: anInteger [ 
	second := anInteger
]
