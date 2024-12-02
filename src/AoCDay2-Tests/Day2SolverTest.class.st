Class {
	#name : 'Day2SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay2-Tests',
	#package : 'AoCDay2-Tests'
}

{ #category : 'test data' }
Day2SolverTest >> sampleInput [
	^ '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'
]

{ #category : 'tests' }
Day2SolverTest >> testParseRawData [
	| solver |
	solver := Day2Solver newFromString: self sampleInput.
	self assert: solver reports size equals: 6.
	self assert: (solver reports at: 1) levels equals: (OrderedCollection newFrom: #(7 6 4 2 1)).
]

{ #category : 'tests' }
Day2SolverTest >> testSolvePart1 [
	| solver |
	solver := Day2Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 2
]

{ #category : 'tests' }
Day2SolverTest >> testSolvePart2 [
	| solver |
	solver := Day2Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 4
]
