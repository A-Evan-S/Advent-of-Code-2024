Class {
	#name : 'Day11SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay11-Tests',
	#package : 'AoCDay11-Tests'
}

{ #category : 'test data' }
Day11SolverTest >> sampleInput [
	^ '125 17'
]

{ #category : 'tests' }
Day11SolverTest >> testSolvePart1 [
	| solver |
	solver := Day11Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 55312
]

{ #category : 'tests' }
Day11SolverTest >> testSolvePart2 [
	| solver |
	solver := Day11Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: -1
]
