"
A Day24SolverTest is a test class for testing the behavior of Day24Solver
"
Class {
	#name : 'Day24SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay24-Tests',
	#package : 'AoCDay24-Tests'
}

{ #category : 'test data' }
Day24SolverTest >> sampleInput [
	^ ''
]

{ #category : 'tests' }
Day24SolverTest >> testSolvePart1 [

	| solver |
	solver := Day24Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 0
]

{ #category : 'tests' }
Day24SolverTest >> testSolvePart2 [

	| solver |
	solver := Day24Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 0
]
