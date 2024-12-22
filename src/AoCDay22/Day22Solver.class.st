"
I am a solver for day 21 of Advent of Code 2024
"
Class {
	#name : 'Day22Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'startingNumbers'
	],
	#category : 'AoCDay22',
	#package : 'AoCDay22'
}

{ #category : 'parsing' }
Day22Solver >> parseRawData [

	startingNumbers := rawData lines collect: #asInteger
]

{ #category : 'solving' }
Day22Solver >> solvePart1 [

   | prng |
   ^ startingNumbers collectAndSum: [ :startingNum |
        prng := Day22PRNG new startingNumber: startingNum.
        2000 timesRepeat: [ prng next ].
        prng currentNumber ]
]

{ #category : 'solving' }
Day22Solver >> solvePart2 [

   | sums prng key totalSums |
   totalSums := Dictionary new.
   startingNumbers do: [ :startingNum |
      sums := Dictionary new.
      prng := Day22PRNG new startingNumber: startingNum.
      prng next; next; next; next.
		1996 timesRepeat: [ 
			key := prng deltaHistory asString.
         sums at: key put: (sums at: key ifAbsent: prng price).
         prng next ].
      sums keysAndValuesDo: [ :k :v | totalSums at: k update: [ :curr | curr + v ] initial: v ] ].
   ^ totalSums values max
]
