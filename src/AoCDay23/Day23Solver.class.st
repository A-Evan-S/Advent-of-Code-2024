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
		(computers at: (comps first) ifAbsentPut: (OrderedCollection new)) add: comps second.
		(computers at: (comps second) ifAbsentPut: (OrderedCollection new)) add: comps first.
	].
]

{ #category : 'solving' }
Day23Solver >> solvePart1 [

   | count testing |
   count := 0.
   computers keysAndValuesDo: [ :comp :neighbors |
      neighbors combinations: 2 atATimeDo: [ :comb |
         testing := comb , { comp }.
         (self isClique: testing) & (testing anySatisfy: [ :x | x first = $t ]) ifTrue: [
            count := count + 1 ] ] ].
   ^ count // 3
]

{ #category : 'solving' }
Day23Solver >> solvePart2 [

   | testing maxSize |
   maxSize := computers values first size + 1.
   maxSize to: 1 by: -1 do: [ :size |
      computers keysAndValuesDo: [ :comp :neighbors |
         neighbors combinations: size - 1 atATimeDo: [ :comb |
            testing := comb asOrderedCollection , { comp }.
            (self isClique: testing) ifTrue: [
               ^ ',' join: testing sorted ] ] ] ].
   ^ nil
]
