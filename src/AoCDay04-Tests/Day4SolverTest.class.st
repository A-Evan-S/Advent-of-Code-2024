"
A Day4SolverTest is a test class for testing the behavior of Day4Solver
"
Class {
	#name : 'Day4SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay04-Tests',
	#package : 'AoCDay04-Tests'
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
Day4SolverTest >> testCountXmasAt [
	| solver |
	solver := Day4Solver newFromString: self sampleInput.
	self assert: (solver countXmasAt: 1 @ 6) equals: 1.
	self assert: (solver countXmasAt: 5 @ 7) equals: 2.
	self assert: (solver countXmasAt: 8 @ 3) equals: 0.
]

{ #category : 'tests' }
Day4SolverTest >> testIsDiagonalXmasAt [
	| solver |
	solver := Day4Solver newFromString: self sampleInput.
	self assert: (solver isDiagonalXmasAt: 2 @ 3).
	self assert: (solver isDiagonalXmasAt: 8 @ 2).
	self deny: (solver isDiagonalXmasAt: 1 @ 8).
]

{ #category : 'tests' }
Day4SolverTest >> testIsXmasAtDirection [
	| solver |
	solver := Day4Solver newFromString: self sampleInput.
	self assert: (solver isXmasAt: 1 @ 6 direction: 0 @ 1).
	self assert: (solver isXmasAt: 1 @ 5 direction: 1 @ 1).
	self deny: (solver isXmasAt: 2 @ 2 direction: 1 @ 1).
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
