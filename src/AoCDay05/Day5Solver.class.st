"
I am a solver for day 5 of Advent of Code 2024
"
Class {
	#name : 'Day5Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'rules',
		'updates'
	],
	#category : 'AoCDay05',
	#package : 'AoCDay05'
}

{ #category : 'parsing' }
Day5Solver >> parseRawData [
	| inputPieces |
	inputPieces := ('<n><n>' expandMacros) split: rawData.
	rules := inputPieces first lines collect: [ :ruleString | (ruleString splitOn: $|) collect: #asInteger ].
	updates := inputPieces second lines collect: [ :updateString | Day5Update newFromString: updateString].
]

{ #category : 'solving' }
Day5Solver >> solvePart1 [

	^ (updates
		   select: [ :update |
		   rules allSatisfy: [ :rule | update satisfies: rule ] ]
		   thenCollect: #middlePageNumber) sum
]

{ #category : 'solving' }
Day5Solver >> solvePart2 [

	^ (updates
		   select: [ :update | (rules allSatisfy: [ :rule | update satisfies: rule ]) not ]
		   thenCollect: [ :update | (update sortedWith: rules) middlePageNumber ]) sum
]
