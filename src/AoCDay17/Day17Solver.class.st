"
I am a solver for day 17 of Advent of Code 2024
"
Class {
	#name : 'Day17Solver',
	#superclass : 'AoCSolver',
	#instVars : [
		'aInitial',
		'bInitial',
		'cInitial',
		'program'
	],
	#category : 'AoCDay17',
	#package : 'AoCDay17'
}

{ #category : 'parsing' }
Day17Solver >> parseRawData [

	| nums |
	nums := ('\d+' asRegex matchesIn: rawData) collect: #asInteger.
	aInitial := nums first.
	bInitial := nums second.
	cInitial := nums third.
	program := nums allButFirst: 3
]

{ #category : 'simulating' }
Day17Solver >> runComputer: aStart [

	| computer |
	computer := Day17Computer new a: aStart; b: bInitial; c: cInitial; program: program.
	[ computer halted ] whileFalse: [ computer step ].
	^ computer output
]

{ #category : 'solving' }
Day17Solver >> solve2Helper: a finished: n [

	| output target recResult |
	n = program size ifTrue: [ ^ a ].
	target := program at: program size - n.
	0 to: 7 do: [ :x |
		output := self runComputer: a << 3 + x.
		output first = target ifTrue: [
			recResult := self solve2Helper: a << 3 + x finished: n + 1.
			recResult > 0 ifTrue: [ ^ recResult ] ] ].
	^ 0
]

{ #category : 'solving' }
Day17Solver >> solvePart1 [

	^ $, join: ((self runComputer: aInitial) collect: #asString)
]

{ #category : 'solving' }
Day17Solver >> solvePart2 [

	^ self solve2Helper: 0 finished: 0
]
