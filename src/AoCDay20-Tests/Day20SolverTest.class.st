"
A Day20SolverTest is a test class for testing the behavior of Day20Solver
"
Class {
	#name : 'Day20SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay20-Tests',
	#package : 'AoCDay20-Tests'
}

{ #category : 'test data' }
Day20SolverTest >> sampleInput [

	^ ''
]

{ #category : 'tests' }
Day20SolverTest >> testSolvePart1 [

	| solver |
	solver := Day20Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 0
]

{ #category : 'tests' }
Day20SolverTest >> testSolvePart2 [

	| solver |
	solver := Day20Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 0
]
