"
A Day20SolverTest is a test class for testing the behavior of Day20Solver
"
Class {
	#name : 'Day20SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay20-Tests',
	#package : 'AoCDay20-Tests'
}

{ #category : 'test data' }
Day20SolverTest >> sampleInput [

	^ '###############
#...#...#.....#
#.#.#.#.#.###.#
#S#...#.#.#...#
#######.#.#.###
#######.#.#...#
#######.#.###.#
###..E#...#...#
###.#######.###
#...###...#...#
#.#####.#.###.#
#.#...#.#.#...#
#.#.#.#.#.#.###
#...#...#...###
###############'
]

{ #category : 'tests' }
Day20SolverTest >> testSolvePart1 [

	| solver |
	solver := (Day20Solver newFromString: self sampleInput) goal: 10.
	self assert: solver solvePart1 equals: 10
]

{ #category : 'tests' }
Day20SolverTest >> testSolvePart2 [

	| solver |
	solver := (Day20Solver newFromString: self sampleInput) goal: 50.
	self assert: solver solvePart2 equals: 285
]
