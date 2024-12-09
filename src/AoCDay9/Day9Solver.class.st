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

	| num |
	blocks := OrderedCollection new.
	gaps := OrderedCollection new.
	both := OrderedCollection new.
	rawData withIndexDo: [ :d :i |
		num := d asInteger - $0 asInteger.
		both add: num.
		i % 2 = 0
			ifTrue: [ gaps add: num ]
			ifFalse: [ blocks add: num ] ]
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
	|blocksWithPos gapsWithPos idx block gapIdx gap result |
	blocksWithPos := OrderedCollection new.
	gapsWithPos := OrderedCollection new.
	blocksWithPos add: ( Day9Block new blockSize: (blocks first); position: 0; id: 0).
	idx := blocks first.
	2 to: blocks size do: [ :i |
		gapsWithPos add: (Day9Gap new gapSize: (gaps at: i - 1); position: idx).
		idx := idx + (gaps at: i - 1).
		blocksWithPos add: ( Day9Block new blockSize: (blocks at: i); position: idx; id: i-1).
		idx := idx + (blocks at: i).
	].
	blocks size to: 1 by: -1 do: [ :i |
		block := blocksWithPos at: i.
		gapIdx := gapsWithPos findFirst: [ :g | g gapSize >= block blockSize ].
		(gapIdx > 0) ifTrue: [
			gap := gapsWithPos at: gapIdx.
			(gap position < block position) ifTrue: [ 
			block position: gap position.
			gap gapSize: gap gapSize - block blockSize.
			gap position: gap position + block blockSize.
			]
		].
	].
	result := 0.
	blocksWithPos do: [ :b |
		b position to: (b position + (b blockSize) - 1) do: [ :i |
			result := result + (b id * i).
		].	
	].
	^ result
]
