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
	#category : 'AoCDay5',
	#package : 'AoCDay5'
}

{ #category : 'parsing' }
Day5Solver >> parseRawData [
	| rulesString updatesString idx |
	idx := rawData findString: ('<n><n>' expandMacros).
	rulesString := rawData first: idx.
	updatesString := rawData allButFirst: idx + 3.
	rules := rulesString lines collect: [ :ruleString | Day5Rule newFromString: ruleString].
	updates := updatesString lines collect: [ :updateString | Day5Update newFromString: updateString].
]

{ #category : 'solving' }
Day5Solver >> solvePart1 [

	^ (updates
		   select: [ :update | rules allSatisfy: [ :rule | update satisfies: rule ] ]
		   thenCollect: [ :update | update middlePageNumber ]) sum
]

{ #category : 'solving' }
Day5Solver >> solvePart2 [

	^ (updates
		   select: [ :update |
		   (rules allSatisfy: [ :rule | update satisfies: rule ]) not ]
		   thenCollect: [ :update | (update sortWith: rules) middlePageNumber ]) sum
]
