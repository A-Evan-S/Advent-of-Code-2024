"
A Day13SolverTest is a test class for testing the behavior of Day13Solver
"
Class {
	#name : 'Day13SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay13-Tests',
	#package : 'AoCDay13-Tests'
}

{ #category : 'test data' }
Day13SolverTest >> sampleInput [

	^ 'Button A: X+94, Y+34<n>Button B: X+22, Y+67<n>Prize: X=8400, Y=5400<n><n>Button A: X+26, Y+66<n>Button B: X+67, Y+21<n>Prize: X=12748, Y=12176<n><n>Button A: X+17, Y+86<n>Button B: X+84, Y+37<n>Prize: X=7870, Y=6450<n><n>Button A: X+69, Y+23<n>Button B: X+27, Y+71<n>Prize: X=18641, Y=10279' expandMacros
]

{ #category : 'tests' }
Day13SolverTest >> testSolvePart1 [

	| solver |
	solver := Day13Solver newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 480.
]

{ #category : 'tests' }
Day13SolverTest >> testSolvePart2 [

	| solver |
	solver := Day13Solver newFromString: self sampleInput.
	self assert: solver solvePart2 equals: 875318608908
]
