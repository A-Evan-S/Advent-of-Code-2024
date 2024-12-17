"
A Day17SolverTest is a test class for testing the behavior of Day17Solver
"
Class {
	#name : 'Day17SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay17-Tests',
	#package : 'AoCDay17-Tests'
}

{ #category : 'test data' }
Day17SolverTest >> sampleInput [
	^ 'Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0'
]

{ #category : 'test data' }
Day17SolverTest >> sampleInput2 [
	^ 'Register A: 2024
Register B: 0
Register C: 0

Program: 0,3,5,4,3,0'
]

{ #category : 'tests' }
Day17SolverTest >> testSolvePart1 [

	| solver |
	solver := Day17Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: '4,6,3,5,6,3,5,2,1,0'
]

{ #category : 'tests' }
Day17SolverTest >> testSolvePart2 [

	| solver |
	solver := Day17Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 117440
]
