"
I am a report consisting of multiple levels.
"
Class {
	#name : 'Day2Report',
	#superclass : 'Object',
	#instVars : [
		'levels'
	],
	#category : 'AoCDay2',
	#package : 'AoCDay2'
}

{ #category : 'instance creation' }
Day2Report class >> newFromString: aString [ 
	^ self new levels: ((aString findTokens: ' ') collect: [ :x | x asNumber ])
]

{ #category : 'testing' }
Day2Report >> isDecreasing [
	^ (levels overlappingPairsCollect: [ :a :b | a > b ]) allSatisfy: [ :x | x ].
]

{ #category : 'testing' }
Day2Report >> isIncreasing [
	^ (levels overlappingPairsCollect: [ :a :b | a < b ]) allSatisfy: [ :x | x ].
]

{ #category : 'testing' }
Day2Report >> isNearlySafe [
	^ (1 to: levels size) anySatisfy: [ :idx | (self class new levels:(levels copyWithoutIndex: idx)) isSafe]
]

{ #category : 'testing' }
Day2Report >> isSafe [
	^ (self isIncreasing or: self isDecreasing) and: self levelsAreSimilar
]

{ #category : 'accessing' }
Day2Report >> levels [

	^ levels
]

{ #category : 'accessing' }
Day2Report >> levels: anObject [

	levels := anObject
]

{ #category : 'testing' }
Day2Report >> levelsAreSimilar [
	^ (levels overlappingPairsCollect: [ :a :b | (a - b) abs between: 1 and: 3]) allSatisfy: [ :x | x ].
]
