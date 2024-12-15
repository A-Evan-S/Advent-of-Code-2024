"
I am a general solver for Advent of Code problems with the ability to parse inputs into Arrays of Strings.
"
Class {
	#name : 'AoCSolver',
	#superclass : 'Object',
	#instVars : [
		'rawData'
	],
	#category : 'AoCTools',
	#package : 'AoCTools'
}

{ #category : 'instance creation' }
AoCSolver class >> newFromFilename: filename [
	| fixedString |
	fixedString := String cr join: filename asFileReference contents lines.
	^ self new rawData: fixedString; parseRawData
]

{ #category : 'instance creation' }
AoCSolver class >> newFromString: aString [
	| fixedString |
	fixedString := String cr join: aString lines.
	^ self new rawData: fixedString; parseRawData
]

{ #category : 'parsing' }
AoCSolver >> parseRawData [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
AoCSolver >> rawData [

	^ rawData
]

{ #category : 'accessing' }
AoCSolver >> rawData: anObject [

	rawData := anObject
]

{ #category : 'solving' }
AoCSolver >> solvePart1 [
	^ self subclassResponsibility
]

{ #category : 'solving' }
AoCSolver >> solvePart2 [
	^ self subclassResponsibility
]
