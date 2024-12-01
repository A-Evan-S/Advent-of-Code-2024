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
	^ self new rawData: filename asFileReference contents lines; parseRawData
]

{ #category : 'instance creation' }
AoCSolver class >> newFromString: aString [
	^ self new rawData: aString lines; parseRawData
]

{ #category : 'accessing' }
AoCSolver >> rawData [

	^ rawData
]

{ #category : 'accessing' }
AoCSolver >> rawData: anObject [

	rawData := anObject
]
