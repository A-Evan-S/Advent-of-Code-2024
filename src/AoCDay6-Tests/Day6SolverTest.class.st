"
A Day6SolverTest is a test class for testing the behavior of Day6Solver
"
Class {
	#name : 'Day6SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay6-Tests',
	#package : 'AoCDay6-Tests'
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
Day6SolverTest >> testSolvePart1 [
	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 41.
]

{ #category : 'tests' }
Day6SolverTest >> testSolvePart2 [
	| solver |
	solver := Day6Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 6.
]
