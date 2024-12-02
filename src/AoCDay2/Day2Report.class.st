"
I am a report consisting of multiple levels.
"
Class {
	#name : 'Day2Report',
	#superclass : 'OrderedCollection',
	#category : 'AoCDay2',
	#package : 'AoCDay2'
}

{ #category : 'instance creation' }
Day2Report class >> newFromString: aString [ 
	^ self newFrom: ((aString findTokens: ' ') collect: [ :x | x asNumber ])
]

{ #category : 'testing' }
Day2Report >> isDecreasing [
	^ (self overlappingPairsCollect: [ :a :b | a > b ]) allSatisfy: [ :x | x ].
]

{ #category : 'testing' }
Day2Report >> isIncreasing [
	^ (self overlappingPairsCollect: [ :a :b | a < b ]) allSatisfy: [ :x | x ].
]

{ #category : 'testing' }
Day2Report >> isNearlySafe [
	^ (1 to: self size) anySatisfy: [ :idx | (self copyWithoutIndex: idx) isSafe]
]

{ #category : 'testing' }
Day2Report >> isSafe [
	^ (self isIncreasing or: self isDecreasing) and: self levelsAreSimilar
]

{ #category : 'testing' }
Day2Report >> levelsAreSimilar [
	^ (self overlappingPairsCollect: [ :a :b | (a - b) abs between: 1 and: 3]) allSatisfy: [ :x | x ].
]
