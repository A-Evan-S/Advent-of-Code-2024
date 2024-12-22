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
Day22SolverTest >> sampleInput1 [

	^ '1
10
100
2024'
]

{ #category : 'test data' }
Day22SolverTest >> sampleInput2 [

	^ '1
2
3
2024'
]

{ #category : 'tests' }
Day22SolverTest >> testSolvePart1 [

	| solver |
	solver := Day22Solver newFromString: self sampleInput1.
	self assert: solver solvePart1 equals: 37327623
]

{ #category : 'tests' }
Day22SolverTest >> testSolvePart2 [

	| solver |
	solver := Day22Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 23
]
