"
A Day9SolverTest is a test class for testing the behavior of Day9Solver
"
Class {
	#name : 'Day9SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay09-Tests',
	#package : 'AoCDay09-Tests'
}

{ #category : 'test data' }
Day9SolverTest >> sampleInput [
	^ '2333133121414131402'
]

{ #category : 'tests' }
Day9SolverTest >> testSolvePart1 [

	| solver |
	solver := Day9Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 1928.
]

{ #category : 'tests' }
Day9SolverTest >> testSolvePart2 [

	| solver |
	solver := Day9Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 2858.
]
