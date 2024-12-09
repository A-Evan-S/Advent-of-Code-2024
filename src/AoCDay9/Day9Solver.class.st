"
I am a solver for day 9 of Advent of Code 2024
"
Class {
	#name : 'Day9Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'blocks',
		'gaps',
		'both'
	],
	#category : 'AoCDay9',
	#package : 'AoCDay9'
}

{ #category : 'parsing' }
Day9Solver >> parseRawData [

	| idx |
	both := (rawData asByteArray - $0 asInteger) asArray.
	blocks := OrderedCollection new.
	gaps := OrderedCollection new.
	idx := 0.
	both withIndexDo: [ :num :i |
		i even
			ifTrue: [
				gaps add: (Day9Gap new
						 gapSize: num;
						 position: idx) ]
			ifFalse: [
				blocks add: (Day9Block new
						 blockSize: num;
						 position: idx;
						 id: i // 2) ].
		idx := idx + num ]
]

{ #category : 'solving' }
Day9Solver >> solvePart1 [
	| blocksWithIDs idx result everySpot |
	blocksWithIDs := (blocks collectWithIndex: [ :x :i |(1 to: x) collect: [ :v | i - 1] ]) flattened asOrderedCollection .
	idx := 0.
	result := 0.
	everySpot := (both withIndexCollect: [ :size :i | (1 to: size) collect: [ :x |(i odd)] ]) flattened.
	everySpot withIndexDo: [ :x :i |
		blocksWithIDs isEmpty ifFalse: [
				x ifTrue: [
					result := i - 1 * (blocksWithIDs removeFirst) + result.
				] ifFalse: [
					result := i - 1 * (blocksWithIDs removeLast) + result.
				]
		].	
	].
	^ result
]

{ #category : 'solving' }
Day9Solver >> solvePart2 [

	| gapIdx gap |
	blocks reversed do: [ :block |
		gapIdx := gaps findFirst: [ :g | g gapSize >= block blockSize ].
		gapIdx > 0 ifTrue: [
			gap := gaps at: gapIdx.
			gap position < block position ifTrue: [
				block position: gap position.
				gap gapSize: gap gapSize - block blockSize.
				gap position: gap position + block blockSize ] ] ].
	^ (blocks collect: [ :b | (b position to: b position + b blockSize - 1) sum * b id ]) sum
]
