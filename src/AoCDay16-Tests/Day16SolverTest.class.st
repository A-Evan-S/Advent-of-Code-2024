"
A Day16SolverTest is a test class for testing the behavior of Day16Solver
"
Class {
	#name : 'Day16SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay16-Tests',
	#package : 'AoCDay16-Tests'
}

{ #category : 'test data' }
Day16SolverTest >> sampleInput1 [

	^ '###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############'
]

{ #category : 'test data' }
Day16SolverTest >> sampleInput2 [

	^ '#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################'
]

{ #category : 'tests' }
Day16SolverTest >> testSolvePart1 [

	| solver |
	solver := Day16Solver newFromString: self sampleInput1.
	self assert: solver solvePart1 equals: 7036.
	solver := Day16Solver newFromString: self sampleInput2.
	self assert: solver solvePart1 equals: 11048.
]

{ #category : 'tests' }
Day16SolverTest >> testSolvePart2 [

	| solver |
	solver := Day16Solver newFromString: self sampleInput1.
	self assert: solver solvePart2 equals: 45.
	solver := Day16Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 64.
]
