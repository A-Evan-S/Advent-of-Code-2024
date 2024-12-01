Class {
	#name : 'Day1SolverTest',
	#superclass : 'TestCase',
	#category : 'AoCDay1-Tests',
	#package : 'AoCDay1-Tests'
}

{ #category : 'tests' }
Day1SolverTest >> testCountRightOccurrences [
	| rawData solver |
	rawData :=
'3   4
4   3
2   5
1   3
3   9
3   3'.
	solver := Day1Solver newFromString: rawData.
	self assert: (solver countRightOccurrences: 3) equals: 3.
	self assert: (solver countRightOccurrences: 5) equals: 1.
	self assert: (solver countRightOccurrences: 2) equals: 0.
]

{ #category : 'tests' }
Day1SolverTest >> testProcessRawData [
	| rawData solver |
	rawData :=
'3   4
4   3
2   5
1   3
3   9
3   3'.
	solver := Day1Solver newFromString: rawData.
	self assert: solver leftList equals: #(3 4 2 1 3 3).
	self assert: solver rightList equals: #(4 3 5 3 9 3).
]

{ #category : 'tests' }
Day1SolverTest >> testSolvePart1 [
	| rawData solver |
	rawData :=
'3   4
4   3
2   5
1   3
3   9
3   3'.
	solver := Day1Solver newFromString: rawData.
	self assert: solver solvePart1 equals: 11
]

{ #category : 'tests' }
Day1SolverTest >> testSolvePart2 [
	| rawData solver |
	rawData :=
'3   4
4   3
2   5
1   3
3   9
3   3'.
	solver := Day1Solver newFromString: rawData.
	self assert: solver solvePart2 equals: 31
]

{ #category : 'tests' }
Day1SolverTest >> testSorting [
	| rawData solver |
	rawData :=
'3   4
4   3
2   5
1   3
3   9
3   3'.
	solver := Day1Solver newFromString: rawData.
	solver sortLeft.
	self assert: solver leftList equals: #(1 2 3 3 3 4).
	solver sortRight.
	self assert: solver rightList equals: #(3 3 3 4 5 9).
]
