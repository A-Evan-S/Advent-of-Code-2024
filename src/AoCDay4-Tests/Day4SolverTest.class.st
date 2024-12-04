"
A Day4SolverTest is a test class for testing the behavior of Day4Solver
"
Class {
	#name : 'Day4SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay4-Tests',
	#package : 'AoCDay4-Tests'
}

{ #category : 'test data' }
Day4SolverTest >> sampleInput [
	^ 'MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX'
]

{ #category : 'tests' }
Day4SolverTest >> testSolvePart1 [

	| solver |
	solver := Day4Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 18
]

{ #category : 'tests' }
Day4SolverTest >> testSolvePart2 [

	| solver |
	solver := Day4Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 9
]
