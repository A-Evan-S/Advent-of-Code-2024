"
A Day23SolverTest is a test class for testing the behavior of Day23Solver
"
Class {
	#name : 'Day23SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay23-Tests',
	#package : 'AoCDay23-Tests'
}

{ #category : 'test data' }
Day23SolverTest >> sampleInput [

	^ ''
]

{ #category : 'tests' }
Day23SolverTest >> testSolvePart1 [

	| solver |
	solver := Day23Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 0
]

{ #category : 'tests' }
Day23SolverTest >> testSolvePart2 [

	| solver |
	solver := Day23Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 0
]
