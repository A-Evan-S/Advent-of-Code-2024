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
Day19Solver >> canBuild: design [

	design ifEmpty: [ ^ true ].
	^ (patterns select: [ :pattern | design beginsWith: pattern ])
		  anySatisfy: [ :pattern | self canBuild: (design allButFirst: pattern size) ]
]

{ #category : 'solving' }
Day19Solver >> countBuilds: design [

	| ans |
	design ifEmpty: [ ^ 1 ].
	(cache includesKey: design) ifTrue: [ ^ cache at: design ].
	ans := ((patterns select: [ :pattern | design beginsWith: pattern ])
		        collect: [ :option |
		        self countBuilds: (design allButFirst: option size) ])
		       sumNumbers.
	cache at: design put: ans.
	^ ans
]

{ #category : 'initialization' }
Day19Solver >> initialize [

	cache := Dictionary new
]

{ #category : 'parsing' }
Day19Solver >> parseRawData [

	patterns := rawData lines first splitOn: ', '.
	designs := rawData lines allButFirst: 2.
]

{ #category : 'solving' }
Day19Solver >> solvePart1 [

	^ designs count: [ :design | self canBuild: design ]
]

{ #category : 'solving' }
Day19Solver >> solvePart2 [

	^ (designs collect: [ :design | self countBuilds: design ]) sum
]
