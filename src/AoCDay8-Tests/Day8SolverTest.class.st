Class {
	#name : 'Day8SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay8-Tests',
	#package : 'AoCDay8-Tests'
}

{ #category : 'test data' }
Day8SolverTest >> sampleInput [
	^ '............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............'
]

{ #category : 'tests' }
Day8SolverTest >> testSolvePart1 [
	| solver |
	solver := Day8Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 14.
]

{ #category : 'tests' }
Day8SolverTest >> testSolvePart2 [

	| solver |
	solver := Day8Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 34
]
