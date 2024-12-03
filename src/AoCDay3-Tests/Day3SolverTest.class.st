"
A Day3SolverTest is a test class for testing the behavior of Day3Solver
"
Class {
	#name : 'Day3SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay3-Tests',
	#package : 'AoCDay3-Tests'
}

{ #category : 'test data' }
Day3SolverTest >> sampleInput [
	^ 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'
]

{ #category : 'test data' }
Day3SolverTest >> sampleInput2 [
	^ 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))'
]

{ #category : 'tests' }
Day3SolverTest >> testEvalMul [
	| solver |
	solver := Day3Solver new.
	
	self assert: (solver evalMul: 'mul(3,12)') equals: 36.
	self assert: (solver evalMul: 'mul(1,45)') equals: 45.
	self assert: (solver evalMul: 'mul(123,456)') equals: 56088.
]

{ #category : 'tests' }
Day3SolverTest >> testSolvePart1 [
	| solver |
	solver := Day3Solver  newFromString: self sampleInput.
	self assert: solver solvePart1 equals: 161.
]

{ #category : 'tests' }
Day3SolverTest >> testSolvePart2 [
	| solver |
	solver := Day3Solver newFromString: self sampleInput2.
	self assert: solver solvePart2 equals: 48
]
