"
A Day18SolverTest is a test class for testing the behavior of Day18Solver
"
Class {
	#name : 'Day18SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay18-Tests',
	#package : 'AoCDay18-Tests'
}

{ #category : 'test data' }
Day18SolverTest >> sampleInput [
	^ ''
]

{ #category : 'tests' }
Day18SolverTest >> testSolvePart1 [

	| solver |
	solver := Day18Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 0
]

{ #category : 'tests' }
Day18SolverTest >> testSolvePart2 [

	| solver |
	solver := Day18Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 0
]
