"
I am a solver for day 12 of Advent of Code 2024
"
Class {
	#name : 'Day12Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'gardenMap',
		'regions'
	],
	#category : 'AoCDay12',
	#package : 'AoCDay12'
}

{ #category : 'parsing' }
Day12Solver >> parseRawData [

	| numRows numCols gardenLines |
	gardenLines := rawData lines.
	numRows := gardenLines size.
	numCols := (gardenLines at: 1) size.
	gardenMap := Array2D rows: numRows columns: numCols.
	gardenMap indicesDo: [ :r :c |
		gardenMap at: r at: c put: ((gardenLines at: r) at: c) ].
	self processRegions
]

{ #category : 'accessing' }
Day12Solver >> plusNeighborsOf: aPoint [ 
	^ { aPoint + (0@1) . aPoint + (1@0) . aPoint - (0@1) . aPoint - (1@0) }
]

{ #category : 'processing' }
Day12Solver >> processRegionWithPlot: startingPlot [

	| region queue currPlot seen |
	seen := Set new.
	region := Day12Region new label: (gardenMap atPoint: startingPlot).
	queue := OrderedCollection newFrom: { startingPlot }.
	[ queue isNotEmpty ] whileTrue: [
		currPlot := queue removeFirst.
		((seen includes: currPlot) not and: (gardenMap atPoint: currPlot ifInvalid: nil) = region label) ifTrue: [
			region addPlot: currPlot.
			seen add: currPlot.
			queue addAll: (self plusNeighborsOf: currPlot) ] ].
		seen add: currPlot.
	^ region
]

{ #category : 'processing' }
Day12Solver >> processRegions [

	| seen region |
	seen := Set new.
	regions := OrderedCollection new.
	gardenMap indicesDo: [ :r :c |
		(seen includes: r@c) ifFalse: [
			region := self processRegionWithPlot: r@c.
			seen addAll: region plots.
			regions add: region ] ]
]

{ #category : 'solving' }
Day12Solver >> solvePart1 [
	^ (regions collect: [ :region | (region area) * (region perimeter) ]) sum
]

{ #category : 'solving' }
Day12Solver >> solvePart2 [
	^ (regions collect: [ :region | (region area) * (region numSides) ]) sum
]
