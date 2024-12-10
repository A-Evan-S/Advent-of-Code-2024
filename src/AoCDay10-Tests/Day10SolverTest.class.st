"
A Day10SolverTest is a test class for testing the behavior of Day10Solver
"
Class {
	#name : 'Day10SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay10-Tests',
	#package : 'AoCDay10-Tests'
}

{ #category : 'test data' }
Day10SolverTest >> sampleInput [
	^ '0123
1234
8765
9876'
]

{ #category : 'test data' }
Day10SolverTest >> sampleInput2 [
	^ '89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732'
]

{ #category : 'tests' }
Day10SolverTest >> testSolvePart1 [

	|solver|
	solver := Day10Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 1.
	solver := Day10Solver newFromString: self sampleInput2.
	self assert: solver solvePart1 equals: 36.
	
]

{ #category : 'tests' }
Day10SolverTest >> testSolvePart2 [

	|solver|
	solver := Day10Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 81.
]
