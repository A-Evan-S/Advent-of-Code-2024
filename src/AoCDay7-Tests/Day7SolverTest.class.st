"
A Day7SolverTest is a test class for testing the behavior of Day7Solver
"
Class {
	#name : 'Day7SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay7-Tests',
	#package : 'AoCDay7-Tests'
}

{ #category : 'test data' }
Day7SolverTest >> sampleInput [

	^ '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'
]

{ #category : 'tests' }
Day7SolverTest >> testSolvePart1 [

	| solver |
	solver := Day7Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 3749
]

{ #category : 'tests' }
Day7SolverTest >> testSolvePart2 [

	| solver |
	solver := Day7Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 11387
]
