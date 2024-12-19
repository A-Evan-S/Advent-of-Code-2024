"
I am a solver for day 19 of Advent of Code 2024
"
Class {
	#name : 'Day19Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'patterns',
		'designs',
		'cache'
	],
	#category : 'AoCDay19',
	#package : 'AoCDay19'
}

{ #category : 'solving' }
Day19Solver >> canBuild: aString [ 

	| options |
	(aString isEmpty) ifTrue: [ ^ true ].
	options := patterns select: [ :pattern | aString beginsWith: pattern ].
	^ options anySatisfy: [ :option | self canBuild: (aString allButFirst: (option size)) ]
]

{ #category : 'solving' }
Day19Solver >> countBuilds: aString [

	| options ans |
	(cache includesKey: aString) ifTrue: [ ^ cache at: aString ].
	aString isEmpty ifTrue: [ ^ 1 ].
	options := patterns select: [ :pattern | aString beginsWith: pattern ].
	ans := (options collect: [ :option |
		        self countBuilds: (aString allButFirst: option size) ])
		       inject: 0
		       into: [ :a :b | a + b ].
	cache at: aString put: ans.
	^ ans
]

{ #category : 'initialization' }
Day19Solver >> initialize [

	cache := Dictionary new.
]

{ #category : 'parsing' }
Day19Solver >> parseRawData [

	patterns := rawData lines first splitOn: ', '.
	designs := rawData lines allButFirst: 2.
]

{ #category : 'solving' }
Day19Solver >> solvePart1 [

	^ (designs select: [ :design | self canBuild: design ]) size
]

{ #category : 'solving' }
Day19Solver >> solvePart2 [

	^ (designs collect: [ :design | self countBuilds: design ]) sum
]
