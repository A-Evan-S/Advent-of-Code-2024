"
I represent a region containing multiple plots (stored as a set of points)
"
Class {
	#name : 'Day12Region',
	#superclass : 'Object',
	#instVars : [
		'label',
		'plots'
	],
	#category : 'AoCDay12',
	#package : 'AoCDay12'
}

{ #category : 'adding' }
Day12Region >> addPlot: aDay12Plot [ 
	plots add: aDay12Plot
]

{ #category : 'accessing' }
Day12Region >> area [
	^ plots size
]

{ #category : 'accessing' }
Day12Region >> cornersOf: aPoint [ 
	| cornerSets a b c |
	cornerSets := { 
		{ aPoint + (1@0) . aPoint + (0@1) . aPoint + (1@1) } . 
		{ aPoint + (-1@0) . aPoint + (0@1) . aPoint + (-1@1) } . 
		{ aPoint + (1@0) . aPoint + (0@ -1) . aPoint + (1@ -1) } . 
		{ aPoint + (-1@0) . aPoint + (0@ -1) . aPoint + (-1@ -1) } }.
	^ (cornerSets select: [ :cornerSet |
			a := plots includes: cornerSet first.
			b := plots includes: cornerSet second.
			c := plots includes: cornerSet third.
			(a and: (b and: (c not))) or: (a not and: b not)
		]) size
]

{ #category : 'initialization' }
Day12Region >> initialize [
	plots := OrderedCollection new.
]

{ #category : 'accessing' }
Day12Region >> label [

	^ label
]

{ #category : 'accessing' }
Day12Region >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
Day12Region >> numSides [

	^ (plots collect: [ :plot | self cornersOf: plot]) sum
]

{ #category : 'accessing' }
Day12Region >> perimeter [
	^ (plots collect: [ :plot | self perimeterSidesOf: plot] ) sum
]

{ #category : 'accessing' }
Day12Region >> perimeterSidesOf: aPoint [

	| neighbors |
	neighbors := {
		             (aPoint + (0 @ 1)).
		             (aPoint + (1 @ 0)).
		             (aPoint - (0 @ 1)).
		             (aPoint - (1 @ 0)) }.
	^ (neighbors reject: [ :neighbor | plots includes: neighbor ]) size
]

{ #category : 'accessing' }
Day12Region >> plots [

	^ plots
]
