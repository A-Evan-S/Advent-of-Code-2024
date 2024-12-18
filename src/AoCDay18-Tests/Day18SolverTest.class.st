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
	^ '5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0'
]

{ #category : 'tests' }
Day18SolverTest >> testSolvePart1 [

	| solver |
	solver := (Day18Solver newFromString: self sampleInput) gridSize: 6; part1Size: 12.
	self assert: solver solvePart1 equals: 22
]

{ #category : 'tests' }
Day18SolverTest >> testSolvePart2 [

	| solver |
	solver := (Day18Solver newFromString: self sampleInput) gridSize: 6; part1Size: 12.
	self assert: solver solvePart2 equals: '6,1'
]
