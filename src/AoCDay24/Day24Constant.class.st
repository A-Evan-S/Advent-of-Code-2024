"
I am a constant element with no dependencies
"
Class {
	#name : 'Day24Constant',
	#superclass : 'Day24Element',
	#instVars : [
		'value'
	],
	#category : 'AoCDay24',
	#package : 'AoCDay24'
}

{ #category : 'instance creation' }
Day24Constant class >> newOne [
	^ self new value: 1
]

{ #category : 'instance creation' }
Day24Constant class >> newZero [
	^ self new value: 0
]

{ #category : 'accessing' }
Day24Constant >> output [
	^ value
]

{ #category : 'accessing - private' }
Day24Constant >> value: anObject [

	value := anObject
]
