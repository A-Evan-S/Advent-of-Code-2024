"
A Day21SolverTest is a test class for testing the behavior of Day21Solver
"
Class {
	#name : 'Day21SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay21-Tests',
	#package : 'AoCDay21-Tests'
}

{ #category : 'test data' }
Day21SolverTest >> sampleInput [

	^ '029A
980A
179A
456A
379A'
]

{ #category : 'tests' }
Day21SolverTest >> testSolvePart1 [

	| solver |
	solver := Day21Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 126384
]

{ #category : 'tests' }
Day21SolverTest >> testSolvePart2 [

	| solver |
	solver := Day21Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 154115708116294
]
