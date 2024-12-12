"
A Day6SolverTest is a test class for testing the behavior of Day6Solver
"
Class {
	#name : 'Day6SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay06-Tests',
	#package : 'AoCDay06-Tests'
}

{ #category : 'test data' }
Day6SolverTest >> sampleInput [
	^ '....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...'
]

{ #category : 'tests' }
Day6SolverTest >> testAddObstacle [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self deny: (solver hasObstacle: 1 @ 3).
	solver addObstacle: 1 @ 3.
	self assert: (solver hasObstacle: 1 @ 3).
	solver addObstacle: -2 @ 1.
	self deny: (solver hasObstacle: -2 @ 1).
	
]

{ #category : 'tests' }
Day6SolverTest >> testDoesCycle [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self deny: solver doesCycle.
	solver addObstacle: 7 @ 4.
	self assert: solver doesCycle
]

{ #category : 'tests' }
Day6SolverTest >> testHasObstacle [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: (solver hasObstacle: 1 @ 5).
	self assert: (solver hasObstacle: 4 @ 3).
	self deny: (solver hasObstacle: 5 @ 5).
	self deny: (solver hasObstacle: 7 @ 5)
]

{ #category : 'tests' }
Day6SolverTest >> testInBounds [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: (solver inBounds: 1 @ 1).
	self assert: (solver inBounds: 10 @ 1).
	self deny: (solver inBounds: 11 @ 1).
	self deny: (solver inBounds: -1 @ 1).
	self deny: (solver inBounds: 1 @ 0)
]

{ #category : 'tests' }
Day6SolverTest >> testSolvePart1 [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 41
]

{ #category : 'tests' }
Day6SolverTest >> testSolvePart2 [

	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 6
]
