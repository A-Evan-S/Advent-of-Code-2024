Class {
	#name : 'Day1Solver',
	#superclass : 'Object',
	#instVars : [
		'rawData'
	],
	#category : 'AoCDay1',
	#package : 'AoCDay1'
}

{ #category : 'instance creation' }
Day1Solver class >> newFromFilename: filename [
	^ self new rawData: filename asFileReference contents lines
]

{ #category : 'accessing' }
Day1Solver >> rawData [

	^ rawData
]

{ #category : 'accessing' }
Day1Solver >> rawData: anObject [

	rawData := anObject
]
