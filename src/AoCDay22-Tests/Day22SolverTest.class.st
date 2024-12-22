"
A Day22SolverTest is a test class for testing the behavior of Day22Solver
"
Class {
	#name : 'Day22SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay22-Tests',
	#package : 'AoCDay22-Tests'
}

{ #category : 'test data' }
Day22SolverTest >> sampleInput [

	^ ''
]

{ #category : 'tests' }
Day22SolverTest >> testSolvePart1 [

	| solver |
	solver := Day22Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 0
]

{ #category : 'tests' }
Day22SolverTest >> testSolvePart2 [

	| solver |
	solver := Day22Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 0
]
