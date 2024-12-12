"
A Day12SolverTest is a test class for testing the behavior of Day12Solver
"
Class {
	#name : 'Day12SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay12-Tests',
	#package : 'AoCDay12-Tests'
}

{ #category : 'test data' }
Day12SolverTest >> sampleInput1 [
	^ 'AAAA
BBCD
BBCC
EEEC'
]

{ #category : 'test data' }
Day12SolverTest >> sampleInput2 [
	^ 'OOOOO
OXOXO
OOOOO
OXOXO
OOOOO'
]

{ #category : 'test data' }
Day12SolverTest >> sampleInput3 [
	^ 'RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE'
]

{ #category : 'test data' }
Day12SolverTest >> sampleInput4 [

	^ 'EEEEE
EXXXX
EEEEE
EXXXX
EEEEE'
]

{ #category : 'test data' }
Day12SolverTest >> sampleInput5 [

	^ 'AAAAAA
AAABBA
AAABBA
ABBAAA
ABBAAA
AAAAAA'
]

{ #category : 'tests' }
Day12SolverTest >> testSolvePart1 [

	| solver |
	solver := Day12Solver newFromString: self sampleInput1.
	self assert: solver solvePart1 equals: 140.
	solver := Day12Solver newFromString: self sampleInput2.
	self assert: solver solvePart1 equals: 772.
	solver := Day12Solver newFromString: self sampleInput3.
	self assert: solver solvePart1 equals: 1930
]

{ #category : 'tests' }
Day12SolverTest >> testSolvePart2 [

	| solver |
	solver := Day12Solver newFromString: self sampleInput1.
	self assert: solver solvePart2 equals: 80.
	solver := Day12Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 436.
	solver := Day12Solver newFromString: self sampleInput4.
	self assert: solver solvePart2 equals: 236.
	solver := Day12Solver newFromString: self sampleInput5.
	self assert: solver solvePart2 equals: 368.
	solver := Day12Solver newFromString: self sampleInput3.
	self assert: solver solvePart2 equals: 1206.
]
