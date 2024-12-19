"
A Day19SolverTest is a test class for testing the behavior of Day19Solver
"
Class {
	#name : 'Day19SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay19-Tests',
	#package : 'AoCDay19-Tests'
}

{ #category : 'test data' }
Day19SolverTest >> sampleInput [

	^ 'r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb'
]

{ #category : 'tests' }
Day19SolverTest >> testSolvePart1 [

	| solver |
	solver := Day19Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 6
]

{ #category : 'tests' }
Day19SolverTest >> testSolvePart2 [

	| solver |
	solver := Day19Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 16
]
