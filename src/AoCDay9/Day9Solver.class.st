"
I am a solver for day 9 of Advent of Code 2024
"
Class {
	#name : 'Day9Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'blocks',
		'gaps',
		'rawSizes'
	],
	#category : 'AoCDay9',
	#package : 'AoCDay9'
}

{ #category : 'parsing' }
Day9Solver >> parseRawData [

	| idx |
	rawSizes := (rawData asByteArray - $0 asInteger) asArray.
	blocks := OrderedCollection new.
	gaps := OrderedCollection new.
	idx := 0.
	rawSizes withIndexDo: [ :num :i |
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

	| expandedBlocks everySpot |
	expandedBlocks := (blocks collectWithIndex: [ :x :i | (1 to: x blockSize) collect: [ :v | i - 1 ] ]) flattened asOrderedCollection.
	everySpot := (rawSizes withIndexCollect: [ :size :i | (1 to: size) collect: [ :x | i odd ] ]) flattened.
	^ (everySpot withIndexCollect: [ :x :i |
		   expandedBlocks isEmpty
			   ifTrue: [ 0 ]
			   ifFalse: [
				   x
					   ifTrue: [ (i - 1) * expandedBlocks removeFirst ]
					   ifFalse: [ (i - 1) * expandedBlocks removeLast ] ] ]) sum
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
	^ (blocks collect: [ :block | (block position to: block position + block blockSize - 1) sum * block id ]) sum
]
