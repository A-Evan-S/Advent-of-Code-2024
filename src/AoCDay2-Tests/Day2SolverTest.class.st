Class {
	#name : 'Day2SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay2-Tests',
	#package : 'AoCDay2-Tests'
}

{ #category : 'tests' }
Day2SolverTest >> testParseRawData [
	| rawData solver |
	rawData :=
'7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.
	solver := Day2Solver newFromString: rawData.
	self assert: solver reports size equals: 6.
	self assert: (solver reports at: 1) equals: (Day2Report newFromString: '7 6 4 2 1').
]

{ #category : 'tests' }
Day2SolverTest >> testSolvePart1 [
	| rawData solver |
	rawData :=
'7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.
	solver := Day2Solver newFromString: rawData.
	self assert: solver solvePart1 equals: 2
]

{ #category : 'tests' }
Day2SolverTest >> testSolvePart2 [
	| rawData solver |
	rawData :=
'7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.
	solver := Day2Solver newFromString: rawData.
	self assert: solver solvePart2 equals: 4
]
