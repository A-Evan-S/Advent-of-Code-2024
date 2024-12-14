"
A Day14SolverTest is a test class for testing the behavior of Day14Solver
"
Class {
	#name : 'Day14SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay14-Tests',
	#package : 'AoCDay14-Tests'
}

{ #category : 'test data' }
Day14SolverTest >> sampleInput [

	^ 'p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3'
]

{ #category : 'tests' }
Day14SolverTest >> testSolvePart1 [

	| solver |
	solver := Day14Solver newFromString: self sampleInput.
	solver roomSizeWidth: 11 height: 7.
	self assert: solver solvePart1 equals: 12
]

{ #category : 'tests' }
Day14SolverTest >> testSolvePart2 [

	| solver |
	solver := Day14Solver newFromFilename: 'inputs/input14.txt'.
	solver roomSizeWidth: 101 height: 103.
	self assert: solver solvePart2 equals: 6516
]
