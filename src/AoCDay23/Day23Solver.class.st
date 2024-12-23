"
I am a solver for day 23 of Advent of Code 2024
"
Class {
	#name : 'Day23Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'computers'
	],
	#category : 'AoCDay23',
	#package : 'AoCDay23'
}

{ #category : 'solving' }
Day23Solver >> cliquesOfSize: size [

   | potentialCliques |
   potentialCliques := OrderedCollection new.
   computers keysAndValuesDo: [ :comp :neighbors |
      neighbors combinations: size - 1 atATimeDo: [ :comb |
         potentialCliques add: comb asOrderedCollection , { comp } ] ].
   ^ potentialCliques select: [ :x | self isClique: x ]
]

{ #category : 'testing' }
Day23Solver >> isClique: aCollection [

   aCollection withIndexDo: [ :v :i |
      ((computers at: v) includesAll: (aCollection allButFirst: i)) ifFalse: [ ^ false ] ].
   ^ true
]

{ #category : 'parsing' }
Day23Solver >> parseRawData [

   | comps |
   computers := Dictionary new.
   rawData lines do: [ :line |
      comps := line splitOn: '-'.
      (computers at: comps first ifAbsentPut: OrderedCollection new) add: comps second.
      (computers at: comps second ifAbsentPut: OrderedCollection new) add: comps first ]
]

{ #category : 'solving' }
Day23Solver >> solvePart1 [

   ^ ((self cliquesOfSize: 3) count: [ :clique | clique anySatisfy: [ :x | x first = $t ] ]) // 3
]

{ #category : 'solving' }
Day23Solver >> solvePart2 [

   | maxSize cliques |
   maxSize := computers values first size + 1.
   maxSize to: 1 by: -1 do: [ :size |
      cliques := self cliquesOfSize: size.
      cliques ifNotEmpty: [ ^ ',' join: cliques first sorted ] ].
]
